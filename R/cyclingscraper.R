#' @title Scrape cycling data from procyclingstats.com.
#'
#' @description
#' This function webscrapes stage-level race data for Grand Tours and major stage-races in professional cycling.
#' The function can handle multiple races and years.
#'
#' @param races A character race identifier or vector of races. See below for details and examples.
#' @param years Either a number (or vector of numbers) corresponding to requested race year(s) with the format: \code{YYYY}
#' or \code{"all"} for all available race years. Default is \code{"all"}.
#'
#' @param ... Additional arguments passed to \code{\link{racedata}}. Can be:
#' \itemize{
#' \item \code{progress} Logical value indicating whether function should print progress. Default is \code{TRUE}
#' \item \code{sleep} A number corresponding to seconds of sleep time between HTML requests. Default is \code{1}
#' }
#'
#'
#' @details
#' The \code{races} parameter accepts the following inputs:
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
#'
#'
#' @return a dataframe containing stage-level data for \code{races} in \code{year} with the following
#' variables included: \code{race}, \code{year}, \code{stage}, \code{races}, \code{stage_num}, \code{stage_type}, \code{date},
#' \code{departure}, \code{arrival}, \code{parcours_type}, \code{distance}, \code{vertical_meters}, \code{profile_score},
#' \code{startlist_quality}, \code{avg_speed_winner}, \code{won_how}, \code{win_type} and \code{km_solo}.
#'
#' @export
#'
#' @examples
#' #' The examples are not evaluated due to long run time. Remove `if (FALSE) {}` to run.
#'
#' \dontrun{
#'
#' cyclingscraper(races = c("tdf", "giro", "vuelta"), years = 2010:2023)
#'
#' cyclingscraper(races = "tdf", years = "all")
#'
#' cyclingscraper(races = c("suisse", "dauphine"), years = 2022)
#'
#' cyclingscraper(races = "tdf", years = c(1996, 2022, 2023), progress = FALSE, sleep = 2)
#'
#' }
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
