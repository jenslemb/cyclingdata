# Check whether a race was completed in a given year.

This function is for internal use by the functions
[`racedata`](https://jenslemb.github.io/cyclingdata/reference/racedata.md)
and
[`raceinfo`](https://jenslemb.github.io/cyclingdata/reference/raceinfo.md)
to ensure that the webscraping procedure does not return an error.

## Usage

``` r
checkrace(race, year)
```

## Arguments

- race:

  A character race identifier. See below for details.

- year:

  A number corresponding to requested race year with the format: `YYYY`.

## Value

Error message if race was not conducted in requested year. Otherwise
nothing.

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
checkrace(race = "tdf", year = 2020)
```
