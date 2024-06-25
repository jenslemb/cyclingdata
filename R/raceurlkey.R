#' @title Convert race identifiers to URL key
#'
#' @description
#' This function is for internal use by \code{\link{racedata}} and \code{\link{raceinfo}} to convert
#' the race identifier into a URL to be passed into the HTML request of the webscraping procedure.
#'
#' @param race race identifier. See below for details.
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
