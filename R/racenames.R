#' @title Convert race identifier to full names.
#'
#' @description
#' This function is for internal use by `racedata` to (a) print progress
#' and (b) return correct full names of races in the column `race`.
#' in the data produced by the webscraping procedure.
#'
#' @param race A character race identifier. See below for details.
#'
#' @details
#' The `race` parameter accepts the following inputs: `"tdf"` (Tour de France),
#' `"grio"` (Giro d'Italia), `"vuelta"` (La Vuelta ciclista a España), `"dauphine"`
#' (Critérium du Dauphiné), `"suisse"` (Tour de Suisse), `"tirreno"` (Tirreno-Adriatico),
#' `"parisnice"` (Paris-Nice), `"romandie"` (Tour de Romandie), `"catalunya"` (Volta Ciclista a Catalunya),
#' `"pologne"` (Tour de Pologne) and `"basque"` (Itzulia Basque Country).
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

