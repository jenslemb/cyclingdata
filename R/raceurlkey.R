#' @title Convert race identifiers to URL key
#'
#' @description
#' This function is for internal use by `racedata` and `raceinfo` to convert
#' the race identifier into a URL to be passed into the HTML request of the webscraping procedure.
#'
#' @param race race identifier. See below for details.
#'
#' @details
#' The `race` parameter accepts the following inputs: `"tdf"` (Tour de France),
#' `"grio"` (Giro d'Italia), `"vuelta"` (La Vuelta ciclista a España), `"dauphine"`
#' (Critérium du Dauphiné), `"suisse"` (Tour de Suisse), `"tirreno"` (Tirreno-Adriatico),
#' `"parisnice"` (Paris-Nice), `"romandie"` (Tour de Romandie), `"catalunya"` (Volta Ciclista a Catalunya),
#' `"pologne"` (Tour de Pologne) and `"basque"` (Itzulia Basque Country).
#'
#' @return An URL key for procyclingstats.com corresponding to the race requested by user
#' @export
#'
#' @examples
#' raceurlkey("tdf")
raceurlkey <- function(race){

  urlkey <- if (race == "tdf") {
    "tour-de-france"
  } else if (race == "giro") {
    "giro-d-italia"
  } else if (race == "vuelta") {
    "vuelta-a-espana"
  } else if (race == "dauphine") {
    "dauphine"
  } else if (race == "suisse") {
    "tour-de-suisse"
  } else if (race == "tirreno") {
    "tirreno-adriatico"
  } else if (race == "parisnice") {
    "paris-nice"
  } else if (race == "romandie") {
    "tour-de-romandie"
  } else if (race == "catalunya") {
    "volta-a-catalunya"
  } else if (race == "pologne") {
    "tour-de-pologne"
  } else if (race == "basque") {
    "itzulia-basque-country"
  } else {
    stop("Error: Invalid input for argument 'race'")
  }
  return(urlkey)
}
