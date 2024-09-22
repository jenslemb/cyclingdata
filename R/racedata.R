#' @title Scrape stage data from procyclingstats.com.
#'
#' @description
#' This function is for internal use by \code{\link{cyclingscraper}} to retrieve stage-level
#' data.
#'
#' @param race A character race identifier. See below for details.
#' @param year A number corresponding to requested race year with the format: \code{YYYY}
#' @param progress Logical value indicating whether function should print progress. Default is \code{TRUE}.
#' @param sleep A number corresponding to seconds of sleep time between HTML requests
#' to ensure that servers are not overloaded. Minimum value is \code{1} (second) which is also the default.
#'
#' @details
#' The \code{race} parameter accepts the following inputs:
#' \itemize{
#' \item \code{"tdf"} (Tour de France)
#' \item \code{"giro"} (Giro d'Italia)
#' \item \code{"vuelta"} (La Vuelta ciclista a España)
#' \item \code{"dauphine"} (Critérium du Dauphiné)
#' \item \code{"suisse"} (Tour de Suisse)
#' \item \code{"tirreno"} (Tirreno-Adriatico)
#' \item \code{"parisnice"} (Paris-Nice)
#' \item \code{"romandie"} (Tour de Romandie)
#' \item \code{"catalunya"} (Volta Ciclista a Catalunya)
#' \item \code{"pologne"} (Tour de Pologne)
#' \item \code{"basque"} (Itzulia Basque Country)
#' }
#'
#' @return a dataframe containing stage-level data for \code{races} in \code{year} with the following
#' variables included: \code{race}, \code{year}, \code{stage}, \code{races}, \code{stage_num}, \code{stage_type}, \code{date},
#' \code{departure}, \code{arrival}, \code{parcours_type}, \code{distance}, \code{vertical_meters}, \code{profile_score},
#' \code{startlist_quality}, \code{avg_speed_winner}, \code{won_how}, \code{win_type} and \code{km_solo}.
#'
#' @examples
#' #' The example is not evaluated due to long run time. Remove `if (FALSE) {}` to run.
#'
#' \dontrun{
#' racedata("tdf", 2022)
#' }
#' @export
racedata <- function(race, year, progress = TRUE, sleep = 1) {

  if(sleep<1){
    stop("Error: Argument `sleep` must be at least 1.")
  }

  # force characters to lowercase
  race <- tolower(race)

  # check if race exists in database
  checkrace(race, year)

  # get url key from race input
  race_id <- raceurlkey(race)

  # initiate raceinfo() to get race_data with general info about race
  race_data <- raceinfo(race, year)


  # create empty list to store data
  datalist_stage = list()

  stage_id_list <- race_data$stage_id

  for (i in stage_id_list){

    # Print progress
    if(progress==TRUE){
      print(paste0("Scraping ", racenames(race), " ", year, " stage ", i))
      }

    # URL
    url_data <- stringr::str_c("https://www.procyclingstats.com/race/", race_id, "/", year, "/stage-", i, sep = "")

    # Different url if stage is a prologue
    if (i == "prologue") {
      url_data <- stringr::str_c("https://www.procyclingstats.com/race/", race_id, "/", year, "/", i, sep = "")
      }

    # Suspend execution for `sleep` seconds
    Sys.sleep(sleep)

    # Extract data
    temp_stage <- url_data |>
      rvest::read_html() |>
      rvest::html_elements("li > div")|>
      rvest::html_text2()

    temp_stage <- temp_stage[1:34]

    # Extract parcours type
    temp_stage[17] <- url_data |>
      rvest::read_html() |>
      rvest::html_elements("li > div > span") |>
      rvest::html_attr("class")

    # Create data.frame
    stage_data <- t(temp_stage[seq(0,length(temp_stage),2)])
    colnames(stage_data) <- temp_stage[seq(1,length(temp_stage),2)]
    stage_data <-data.frame(stage_data)

    # Clean names of variables
    stage_data <- janitor::clean_names(stage_data)

    # Generate variables
    stage_data <- stage_data |>
      dplyr::mutate(
        distance = as.numeric(stringr::str_remove(distance, "km")),
        avg_temperature = as.numeric(stringr::str_remove(avg_temperature, "°C")),
        profile_score = as.numeric(profile_score),
        startlist_quality = as.numeric(startlist_quality_score),
        vertical_meters = as.numeric(vertical_meters),
        date = lubridate::dmy(date),
        parcours_type = dplyr::case_when("icon_profile_p3" %in% colnames(stage_data) ~ "Hills uphill finish",
                                         "icon_profile_p2" %in% colnames(stage_data) ~ "Hills flat finish",
                                         "icon_profile_p1" %in% colnames(stage_data) ~ "Flat",
                                         "icon_profile_p4" %in% colnames(stage_data) ~ "Mountains flat finish",
                                         "icon_profile_p5" %in% colnames(stage_data) ~ "Mountains uphill finish",
                                         TRUE~NA))

    # avg_speed_winner only observed for non-cancelled stages.
    # Conditional statement avoids error when stage is cancelled
    if (stringr::str_detect(stage_data$avg_speed_winner,pattern = "km/h")) {
      stage_data <- stage_data |>
        dplyr::mutate(avg_speed_winner = as.numeric(stringr::str_remove(avg_speed_winner, "km/h")))
      } else {
      stage_data$avg_speed_winner <- NA
      }

    # variables only relevant for non-tt stages
    if ("won_how" %in% colnames(stage_data)) {
      stage_data <- stage_data |>
        dplyr::mutate(win_type = dplyr::case_when(stringr::str_detect(won_how, "solo")==TRUE~"Solo",
                                           stringr::str_detect(won_how, "deux")==TRUE~"Sprint à deux",
                                           stringr::str_detect(won_how, "large")==TRUE~"Large group sprint",
                                           stringr::str_detect(won_how, "small")==TRUE~"Small group sprint",
                                           stringr::str_detect(won_how, "riders")==TRUE~"Small group sprint",
                                           stringr::str_detect(won_how, "let us know")==TRUE~NA,
                                           TRUE~"Unknown type"),
                      km_solo = ifelse(win_type=="Solo",
                                       as.numeric(stringr::str_remove_all(won_how, "[[:alpha:]-?!]")),
                                       NA),
                      won_how = ifelse(stringr::str_detect(won_how, "let us know")==TRUE,NA,
                                       paste0(won_how))
                      )
    } else {
      stage_data$won_how <- "Time trial"
      stage_data$win_type <- "Time trial"
      stage_data$km_solo <- NA
    }


    # Impute NA in results variables (startlist_quality, avg_speed_winner, win_type, km_solo) if race is not completed
    if (stage_data$date[nrow(stage_data)] > Sys.Date()) {
      stage_data$startlist_quality <- NA
      stage_data$avg_speed_winner <- NA
      stage_data$won_how <- NA
      stage_data$win_type <- NA
      stage_data$km_solo <- NA

      print(paste0(racenames(race), " ", year, " is not yet completed. Returning NA's in:",
                   "`startlist_quality`, `avg_speed_winner`, `won_how`, `win_type` and `km_solo`"))
      }

    # create identification variables
    stage_data$i <- i
    stage_data$race <- racenames(race)
    stage_data$year <- year

    # keep only relevant variables
    stage_data <- stage_data |>
      dplyr::select(race, year, i,
                    date, departure, arrival, parcours_type,
                    distance,vertical_meters, profile_score,
                    startlist_quality, avg_speed_winner, won_how,
                    win_type, km_solo)

    # store data in list
    datalist_stage[[i]] <- stage_data

    }

  #bind data
  stage_data_combined <- dplyr::bind_rows(datalist_stage)

  # merge with race_data from raceinfo()
  data <- dplyr::inner_join(race_data, stage_data_combined, by = c("stage_id" = "i"))

  # Revert manual corrections in stage_id to actual name instead of URL keys.

  if(race_id=="vuelta-a-espana" && year == 2009){
    data$stage_id[1] <- "prologue"
  }

  if(race_id=="tdf" && year == 1988){
    data$stage_id[1] <- "Prelude"
  }

  if(race_id=="paris-nice" && year == 2012){
    data$stage_id[1] <- "1"
  }

  if(race_id=="tour-de-romandie" && year == 1993){
    data$stage_id[7] <- "5"
  }

  if(race_id=="tour-de-romandie" && year == 2023){
    data$stage_id[1] <- "prologue"
  }

  # Stage number
  data <- data |>
    dplyr::mutate(stage_num =
                    dplyr::row_number())

  # reorder columns
  data <- data |>
    dplyr::select(race, year, stage, stage_id, stage_num, stage_type,
                  date, departure, arrival, parcours_type, distance,
                  vertical_meters, profile_score, startlist_quality,
                  avg_speed_winner, won_how, win_type, km_solo)

  return(data)

  }
