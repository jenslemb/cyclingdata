# Convert race identifier to full names.

This function is for internal use by
[`racedata`](https://jenslemb.github.io/cyclingdata/reference/racedata.md)
to (a) print progress and (b) return correct full names of races in the
column `race`. in the data produced by the webscraping procedure.

## Usage

``` r
racenames(race)
```

## Arguments

- race:

  A character race identifier. See below for details.

## Value

The full name of race as character.

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
racenames("tdf")
#> [1] "Tour de France"
```
