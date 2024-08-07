% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/racedata.R
\name{racedata}
\alias{racedata}
\title{Scrape stage data from procyclingstats.com.}
\usage{
racedata(race, year, progress = TRUE, sleep = 1)
}
\arguments{
\item{race}{A character race identifier. See below for details.}

\item{year}{A number corresponding to requested race year with the format: \code{YYYY}}

\item{progress}{Logical value indicating whether function should print progress. Default is \code{TRUE}.}

\item{sleep}{A number corresponding to seconds of sleep time between HTML requests
to ensure that servers are not overloaded. Minimum value is \code{1} (second) which is also the default.}
}
\value{
a dataframe containing stage-level data for \code{races} in \code{year} with the following
variables included: \code{race}, \code{year}, \code{stage}, \code{races}, \code{stage_num}, \code{stage_type}, \code{date},
\code{departure}, \code{arrival}, \code{parcours_type}, \code{distance}, \code{vertical_meters}, \code{profile_score},
\code{startlist_quality}, \code{avg_speed_winner}, \code{won_how}, \code{win_type} and \code{km_solo}.
}
\description{
This function is for internal use by \code{\link{cyclingscraper}} to retrieve stage-level
data.
}
\details{
The \code{race} parameter accepts the following inputs:
\itemize{
\item \code{"tdf"} (Tour de France)
\item \code{"giro"} (Giro d'Italia)
\item \code{"vuelta"} (La Vuelta ciclista a España)
\item \code{"dauphine"} (Critérium du Dauphiné)
\item \code{"suisse"} (Tour de Suisse)
\item \code{"tirreno"} (Tirreno-Adriatico)
\item \code{"parisnice"} (Paris-Nice)
\item \code{"romandie"} (Tour de Romandie)
\item \code{"catalunya"} (Volta Ciclista a Catalunya)
\item \code{"pologne"} (Tour de Pologne)
\item \code{"basque"} (Itzulia Basque Country)
}
}
\examples{
#' The example is not evaluated due to long run time. Remove `if (FALSE) {}` to run.

\dontrun{
racedata("tdf", 2022)
}
}
