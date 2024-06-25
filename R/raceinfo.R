#' @title Scrape race information from procyclingstats.com.
#'
#' @description
#' This function is for internal use by `cyclingscraper` and `racedata` to retrieve information about stages
#' of the requested race.
#'
#' @param race A character race identifier. See below for details.
#' @param year A number corresponding to requested race year with the format: `YYYY`.
#'
#' @details
#' The `race` parameter accepts the following inputs: `"tdf"` (Tour de France),
#' `"grio"` (Giro d'Italia), `"vuelta"` (La Vuelta ciclista a España), `"dauphine"`
#' (Critérium du Dauphiné), `"suisse"` (Tour de Suisse), `"tirreno"` (Tirreno-Adriatico),
#' `"parisnice"` (Paris-Nice), `"romandie"` (Tour de Romandie), `"catalunya"` (Volta Ciclista a Catalunya),
#' `"pologne"` (Tour de Pologne), and `"basque"` (Itzulia Basque Country).
#'
#' @return a dataframe containing race information for `race` in `year` with the following
#' variables included: `stage`, `stage_id` and `stage_type`.
#'
#' @examples
#' raceinfo("tdf", 2022)
#' @export
raceinfo <- function(race, year){

  # Check if race exists in database
  checkrace(race, year)

  # Get URL key from race input
  race_id <- raceurlkey(race)

  # URL
  url_data <- stringr::str_c("https://www.procyclingstats.com/race/", race_id, "/", year, sep = "")

  # Extract data
  race_data <- url_data |>
    rvest::read_html() |>
    rvest::html_elements(css="table.basic")

  temp_length <- length(race_data)

  # Select table to use. completed races have 3 tables where non-completed have 2.
  if (temp_length == 3) {
    race_data <- race_data[[2]] |>
      rvest::html_table()

    } else if (temp_length == 2) {
    race_data <- race_data[[1]] |>
      rvest::html_table()
    }


  # Clean variable names
  race_data <- janitor::clean_names(race_data)

  # Keep only rows concerning stage info
  race_data <- race_data |>
    dplyr::mutate(stage = dplyr::na_if(stage, '')) |>
    tidyr::drop_na(stage, km) |>
    dplyr::select(-c(x, date, day,km))

  # Generate stage_id and stage_type variables
  race_data <- race_data |>
    dplyr::mutate(stage_id =
                    dplyr::case_when(stringr::str_detect(stage,"Prelude")==TRUE~"prologue", #1988 tdf stage 1
                                     stringr::str_detect(stage,"Prologue")==TRUE~"prologue",
                                     stringr::str_detect(stage, "[:digit:][:digit:][:alpha:]")==TRUE~stringr::str_sub(stage,7,9), # in case of e.g. 21a and 21b
                                     stringr::str_detect(stage, "[:digit:][:alpha:]")==TRUE~stringr::str_sub(stage,7,8), # in case of e.g. 2a and 2b
                                     TRUE~stringr::str_extract(stage,"\\d+")),
                  stage_type =
                    dplyr::case_when(stringr::str_detect(stage,"Prologue")==TRUE~"Prologue",
                                     stringr::str_detect(stage,"ITT")==TRUE~"ITT",
                                     stringr::str_detect(stage,"TTT")==TRUE~"TTT",
                                     TRUE~"Road race"))

  # Manual corrections due to inconsistent URL's at procyclingstats.com
  if(race_id=="vuelta-a-espana" && year == 2009){
    race_data$stage_id[1] <- "1"
    }

  if(race_id=="paris-nice" && year == 1952){
    race_data$stage_id[3] <- "3a"
    race_data$stage_id[4] <- "3b"
    }

  if(race_id=="paris-nice" && year == 2012){
    race_data$stage_id[1] <- "prologue"
    }

  if(race_id=="tour-de-romandie" && year == 1993){
    race_data$stage_id[7] <- "6"
    }

  if(race_id=="tour-de-romandie" && year == 2023){
    race_data$stage_id[1] <- "0"
    }

  if(race_id=="tour-de-pologne" && year == 1990){
    race_data <- race_data[-c(1:3),]
    }

  return(race_data)
  }




