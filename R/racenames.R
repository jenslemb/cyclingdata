#' @title Convert race identifier to full names.
#'
#' @description
#' This function is for internal use by \code{\link{racedata}} to (a) print progress
#' and (b) return correct full names of races in the column \code{race}.
#' in the data produced by the webscraping procedure.
#'
#' @param race A character race identifier. See below for details.
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
#' @return The full name of race as character.
#' @export
#'
#' @examples
#' racenames("tdf")
racenames <- function(race){

  racename <- if (race == "tdf") {
    "Tour de France"
  } else if (race == "giro") {
    "Giro d'Italia"
  } else if (race == "vuelta") {
    "La Vuelta ciclista a España"
  } else if (race == "dauphine") {
    "Critérium du Dauphiné"
  } else if (race == "suisse") {
    "Tour de Suisse"
  } else if (race == "tirreno") {
    "Tirreno-Adriatico"
  } else if (race == "parisnice") {
    "Paris-Nice"
  } else if (race == "romandie") {
    "Tour de Romandie"
  } else if (race == "catalunya") {
    "Volta Ciclista a Catalunya"
  } else if (race == "pologne") {
    "Tour de Pologne"
  } else if (race == "basque") {
    "Itzulia Basque Country"
  } else {
    stop("Error: Invalid input for argument 'race'")
  }
  return(racename)
}

