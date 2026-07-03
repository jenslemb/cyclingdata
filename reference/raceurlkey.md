# Convert race identifiers to URL key

This function is for internal use by
[`racedata`](https://jenslemb.github.io/cyclingdata/reference/racedata.md)
and
[`raceinfo`](https://jenslemb.github.io/cyclingdata/reference/raceinfo.md)
to convert the race identifier into a URL to be passed into the HTML
request of the webscraping procedure.

## Usage

``` r
raceurlkey(race)
```

## Arguments

- race:

  race identifier. See below for details.

## Value

An URL key for procyclingstats.com corresponding to the race requested
by user

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
raceurlkey("tdf")
#> [1] "tour-de-france"
```
