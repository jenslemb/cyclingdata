% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{cyclingdata}
\alias{cyclingdata}
\title{A comprehensive dataset on stage-races in professional cycling}
\format{
A data frame with 11,125 rows and 18 columns:
\describe{
  \item{race}{Race name.}
  \item{year}{Year.}
  \item{stage}{Stage name.}
  \item{stage_id}{Stage ID extracted from stage name (e.g., prologue, 1, 2a, 2b).}
  \item{stage_num}{Stage number in order of completion within a given race (e.g., prologue, stage 1, stage 2a, stage 2b
  are assigned 1, 2, 3, 4, respectively).}
  \item{stage_type}{Stage type (Prologue, Road race, ITT, or TTT).}
  \item{date}{Date of race. Format: \code{YYYY-MM-DD}.}
  \item{departure}{Location of departure.}
  \item{arrival}{Location of arrival.}
  \item{parcours_type}{Stage profile type. (Hills uphill finish,
  Hills flat finish, Flat, Mountains flat finish, Mountains uphill finish).}
  \item{distance}{Race length in kilometers.}
  \item{vertical_meters}{Number of vertical meters.}
  \item{profile_score}{Numeric value of race difficulty. See:
  \url{https://www.procyclingstats.com/info/profile-score-explained}}
  \item{startlist_quality}{Numeric value of the quality of riders at the start
  of the race. See: \url{https://www.procyclingstats.com/calendar/uci/startlist-quality>}}
  \item{avg_speed_winner}{Average speed of winner in km/h.}
  \item{won_how}{Description of how the race was won.}
  \item{win_type}{Category of win type (Solo, Sprint à deux, Large group sprint,
  Small group sprint, Unknown type). Small group sprint refers to all sizes of reduced pelotons. Refer to \code{won_how} for more details on group size.}
  \item{km_solo}{Length of winning solo attack (only applies to solo wins).}
}
}
\source{
\url{https://www.procyclingstats.com}
}
\usage{
cyclingdata
}
\description{
A comprehensive dataset on race-level information of all Grand Tours and
major one-week stage races in professional cycling.
}
\keyword{datasets}
