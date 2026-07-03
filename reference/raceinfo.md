# Scrape race information from procyclingstats.com.

This function is for internal use by
[`cyclingscraper`](https://jenslemb.github.io/cyclingdata/reference/cyclingscraper.md)
and
[`racedata`](https://jenslemb.github.io/cyclingdata/reference/racedata.md)
to retrieve information about stages of the requested race.

## Usage

``` r
raceinfo(race, year)
```

## Arguments

- race:

  A character race identifier. See below for details.

- year:

  A number corresponding to requested race year with the format: `YYYY`.

## Value

a dataframe containing race information for `race` in `year` with the
following variables included: `stage`, `stage_id` and `stage_type`.

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
raceinfo("tdf", 2022)
#> Error in open.connection(x, "rb"): cannot open the connection
```
