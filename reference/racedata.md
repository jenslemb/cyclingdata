# Scrape stage data from procyclingstats.com.

This function is for internal use by
[`cyclingscraper`](https://jenslemb.github.io/cyclingdata/reference/cyclingscraper.md)
to retrieve stage-level data.

## Usage

``` r
racedata(race, year, progress = TRUE, sleep = 1)
```

## Arguments

- race:

  A character race identifier. See below for details.

- year:

  A number corresponding to requested race year with the format: `YYYY`

- progress:

  Logical value indicating whether function should print progress.
  Default is `TRUE`.

- sleep:

  A number corresponding to seconds of sleep time between HTML requests
  to ensure that servers are not overloaded. Minimum value is `1`
  (second) which is also the default.

## Value

a dataframe containing stage-level data for `races` in `year` with the
following variables included: `race`, `year`, `stage`, `races`,
`stage_num`, `stage_type`, `date`, `departure`, `arrival`,
`parcours_type`, `distance`, `vertical_meters`, `profile_score`,
`startlist_quality`, `startlist_quality_remaining`, `avg_speed_winner`,
`won_how`, `win_type` and `km_solo`.

## Details

The `race` parameter accepts the following inputs:

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
#' The example is not evaluated due to long run time. Remove `if (FALSE) {}` to run.

if (FALSE) { # \dontrun{
racedata("tdf", 2022)
} # }
```
