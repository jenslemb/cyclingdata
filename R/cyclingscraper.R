#' @title Webscrape cycling data from procyclingstats.com.
#'
#' @description
#' This function webscrapes stage-level race data for Grand Tours and all major stage-races in professional cycling.
#' The function can handle multiple races and years.
#'
#' @param races A character race identifier or vector of races. See below for details and examples.
#' @param years Either a number (or vector of numbers) corresponding to requested race year(s) with the format: `YYYY`
#' or `"all"` for all available race years. Default is `"all"`.
#'
#' @param ... Additional arguments passed to other activated functions
#' (`progress`, `sleep`). See `racedata()` for details.
#'
#'
#'#' @details
#' The `races` parameter accepts the following inputs: `"tdf"` (Tour de France),
#' `"grio"` (Giro d'Italia), `"vuelta"` (La Vuelta ciclista a España), `"dauphine"`
#' (Critérium du Dauphiné), `"suisse"` (Tour de Suisse), `"tirreno"` (Tirreno-Adriatico),
#' `"parisnice"` (Paris-Nice), `"romandie"` (Tour de Romandie), `"catalunya"` (Volta Ciclista a Catalunya),
#' `"pologne"` (Tour de Pologne), and `"basque"` (Itzulia Basque Country).
#'
#' @return a dataframe containing stage-level data for `races` in `year` with the following
#' variables included: `race`, `year`, `stage`, `stage_id`, `stage_num`, `stage_type`, `date`,
#' `departure`, `arrival`, `parcours_type`, `distance`, `vertical_meters`, `profile_score`,
#' `startlist_quality`, `avg_speed_winner`, `won_how`, `win_type` and `km_solo`.
#'
#' @export
#'
#' @examples
#' cyclingscraper(races = c("tdf", "giro", "vuelta"), years = 2010:2023)
#' cyclingscraper(races = "tdf", years = "all")
#' cyclingscraper(races = c("tdf", "dauphine"), years = 2022)
#' cyclingscraper(races = "tdf", years = c(1996, 2022, 2023), progress = FALSE, sleep = 2)
cyclingscraper <- function(races,
                           years,
                           ...) {

  datalist <- list()

    for (r in races){

      if(length(years)==1 && years=="all"){

        race_years <- raceyears()
        yearlist <- race_years[[r]]
        } else {
          yearlist <- years
          }

      for (y in yearlist) {

        temp_data <- racedata(race = r, year = y, ...)
        r_y <- stringr::str_c(r,y,sep = "_")
        datalist[[r_y]] <- temp_data
        }
      }

  data <- dplyr::bind_rows(datalist)

  return(data)

  }
