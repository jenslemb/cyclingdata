#' @title Check whether a race was completed in a given year.
#'
#' @description
#' This function is for internal use by the functions \code{\link{racedata}} and \code{\link{raceinfo}}
#' to ensure that the webscraping procedure does not return an error.
#'
#' @param race A character race identifier. See below for details.
#' @param year A number corresponding to requested race year with the format: \code{YYYY}.
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
#' @return Error message if race was not conducted in requested year. Otherwise nothing.
#' @export
#'
#' @examples
#' checkrace(race = "tdf", year = 2020)
checkrace <- function(race, year) {

  # Get list of all years where races were ridden
  race_years <- raceyears()

  if(race=="tdf" && !(year %in% race_years[["tdf"]])) {
    stop(paste0("Error: ", racenames(race), " ", year, " is not present in database. "))
  }

  if(race=="giro" && !(year %in% race_years[["giro"]])) {
    stop(paste0("Error: ", racenames(race), " ", year, " is not present in database. "))
  }

  if(race=="vuelta" && !(year %in% race_years[["vuelta"]])) {
    stop(paste0("Error: ", racenames(race), " ", year, " is not present in database. "))
  }

  if(race=="dauphine" && !(year %in% race_years[["dauphine"]])) {
    stop(paste0("Error: ", racenames(race), " ", year, " is not present in database. "))
  }

  if(race=="suisse" && !(year %in% race_years[["suisse"]])) {
    stop(paste0("Error: ", racenames(race), " ", year, " is not present in database. "))
  }

  if(race=="tirreno" && !(year %in% race_years[["tirreno"]])) {
    stop(paste0("Error: ", racenames(race), " ", year, " is not present in database. "))
  }

  if(race=="parisnice" && !(year %in% race_years[["parisnice"]])) {
    stop(paste0("Error: ", racenames(race), " ", year, " is not present in database. "))
  }

  if(race=="romandie" && !(year %in% race_years[["romandie"]])) {
    stop(paste0("Error: ", racenames(race), " ", year, " is not present in database. "))
  }

  if(race=="catalunya" && !(year %in% race_years[["catalunya"]])) {
    stop(paste0("Error: ", racenames(race), " ", year, " is not present in database. "))
  }

  if(race=="pologne" && !(year %in% race_years[["pologne"]])) {
    stop(paste0("Error: ", racenames(race), " ", year, " is not present in database. "))
  }

  if(race=="basque" && !(year %in% race_years[["basque"]])) {
    stop(paste0("Error: ", racenames(race), " ", year, " is not present in database. "))
  }

}
