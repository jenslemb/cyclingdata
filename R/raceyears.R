#' @title List of years where races exist.
#'
#' @description
#' This function is for internal use by `cyclingscraper` and `checkrace` to ensure
#' that HTML requests are only passed for years were a given race exists.
#'
#' @return A list containing race years for each race
#' @export
#'
#' @examples
#' raceyears()
raceyears <- function(){

  tdf_years <-  c(1903:1914, 1919:1939, 1947:lubridate::year(Sys.Date()))

  giro_years <-  c(1909:1914,1919:1940, 1946:lubridate::year(Sys.Date()))

  vuelta_years <- c(1935:1936,
                    1941:1942,
                    1945:1947,
                    1948,
                    1950,
                    1955:lubridate::year(Sys.Date()))

  dauphine_years <- c(1947:1966, 1969:lubridate::year(Sys.Date()))

  suisse_years <- c(1933:1939,
                    1941:1942,
                    1946:2019,
                    2021:lubridate::year(Sys.Date()))

  tirreno_years <- c(1966:lubridate::year(Sys.Date()))

  parisnice_years <- c(1933:1939, 1946, 1951:lubridate::year(Sys.Date()))

  romandie_years <- c(1947:2019, 2021:lubridate::year(Sys.Date()))

  catalunya_years <- c(1911:1913,
                       1920,
                       1923:1936,
                       1939:2019,
                       2021:lubridate::year(Sys.Date()))

  pologne_years <- c(1928:1929,
                     1937,
                     1939,
                     1947:1949,
                     1952:lubridate::year(Sys.Date()))

  basque_years <- c(1924:1930, 1935, 1969:2019, 2021:lubridate::year(Sys.Date()))

  race_years <- list(
    tdf = tdf_years,
    giro = giro_years,
    vuelta = vuelta_years,
    dauphine = dauphine_years,
    suisse = suisse_years,
    tirreno = tirreno_years,
    parisnice = parisnice_years,
    romandie = romandie_years,
    catalunya = catalunya_years,
    pologne = pologne_years,
    basque = basque_years
  )

  return(race_years)
}
