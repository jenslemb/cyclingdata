# Scrape cycling data from procyclingstats.com.

This function webscrapes stage-level race data for Grand Tours and major
stage-races in professional cycling. The function can handle multiple
races and years.

## Usage

``` r
cyclingscraper(races, years, ...)
```

## Arguments

- races:

  A character race identifier or vector of races. See below for details
  and examples.

- years:

  Either a number (or vector of numbers) corresponding to requested race
  year(s) with the format: `YYYY` or `"all"` for all available race
  years. Default is `"all"`.

- ...:

  Additional arguments passed to
  [`racedata`](https://jenslemb.github.io/cyclingdata/reference/racedata.md).
  Can be:

  - `progress` Logical value indicating whether function should print
    progress. Default is `TRUE`

  - `sleep` A number corresponding to seconds of sleep time between HTML
    requests. Default is `1`

## Value

a dataframe containing stage-level data for `races` in `year` with the
following variables included: `race`, `year`, `stage`, `races`,
`stage_num`, `stage_type`, `date`, `departure`, `arrival`,
`parcours_type`, `distance`, `vertical_meters`, `profile_score`,
`startlist_quality`, `startlist_quality_remaining`, `avg_speed_winner`,
`won_how`, `win_type` and `km_solo`.

## Details

The `races` parameter accepts the following inputs:

- `"tdf"` (Tour de France)

- `"giro"` (Giro d'Italia)

- `"vuelta"` (La Vuelta ciclista a España)

- `"dauphine"` (Critérium du Dauphiné)

- `"suisse"` (Tour de Suisse)

- `"tirreno"` (Tirreno-Adriatico)

- `"parisnice"` (Paris-Nice)

- `"romandie"` (Tour de Romandie)

- `"catalunya"` (Volta Ciclista a Catalunya)

- `"pologne"` (Tour de Pologne)

- `"basque"` (Itzulia Basque Country)

## Examples

``` r
#' The examples are not evaluated due to long run time. Remove `if (FALSE) {}` to run.

if (FALSE) { # \dontrun{

cyclingscraper(races = c("tdf", "giro", "vuelta"), years = 2010:2023)

cyclingscraper(races = "tdf", years = "all")

cyclingscraper(races = c("suisse", "dauphine"), years = 2022)

cyclingscraper(races = "tdf", years = c(1996, 2022, 2023), progress = FALSE, sleep = 2)

} # }
```
