
<!-- README.md is generated from README.Rmd. Please edit that file -->

## Overview

The `cyclingdata` package presents a comprehensive dataset on major
stage races in professional cycling. This includes all three Grand Tours
(Tour de France, Giro d’Italia, La Vuelta Ciclista a España) in addition
to Critérium du Dauphiné, Itzulia Basque Country, Paris-Nice,
Tirreno-Adriatico, Tour de Pologne, Tour de Romandie, Tour de Suisse,
and Volta Ciclista a Catalunya. (Source:
<https://www.procyclingstats.com>)

The package also contains \[cyclingscraper()\] which enable users to
scrape cycling data directly from <https://www.procyclingstats.com>.

## Installation

``` r
# Install the development version from GitHub
devtools::install_github("jenslemb/cyclingdata")
```

## Usage

### Access cyclingdata

You can access the data simply by loading the package and calling
`cyclingdata`.

``` r
library(cyclingdata)

df <- cyclingdata 
head(df)
#>             race year                          stage stage_id stage_num
#> 1 Tour de France 1903    Stage 1 | Montgeron  - Lyon        1         1
#> 2 Tour de France 1903     Stage 2 | Lyon - Marseille        2         2
#> 3 Tour de France 1903 Stage 3 | Marseille - Toulouse        3         3
#> 4 Tour de France 1903  Stage 4 | Toulouse - Bordeaux        4         4
#> 5 Tour de France 1903    Stage 5 | Bordeaux - Nantes        5         5
#> 6 Tour de France 1903       Stage 6 | Nantes - Paris        6         6
#>   stage_type       date departure   arrival         parcours_type distance
#> 1  Road race 1903-07-01 Montgeron      Lyon                  Flat      467
#> 2  Road race 1903-07-05      Lyon Marseille Mountains flat finish      374
#> 3  Road race 1903-07-08 Marseille  Toulouse                  Flat      423
#> 4  Road race 1903-07-12  Toulouse  Bordeaux                  Flat      268
#> 5  Road race 1903-07-13  Bordeaux    Nantes                  Flat      425
#> 6  Road race 1903-07-18    Nantes     Paris                  Flat      471
#>   vertical_meters profile_score startlist_quality avg_speed_winner
#> 1              NA            NA               310            26.30
#> 2              NA            NA               310            25.83
#> 3              NA            NA               310            23.61
#> 4              NA            NA               310            30.57
#> 5              NA            NA               310            25.85
#> 6              NA            NA               310            25.95
#>         won_how      win_type km_solo
#> 1   0.2 km solo          Solo     0.2
#> 2 Sprint à deux Sprint à deux      NA
#> 3     ? km solo          Solo      NA
#> 4     ? km solo          Solo      NA
#> 5          <NA>          <NA>      NA
#> 6          <NA>          <NA>      NA
```

### Select races or years

You can select specific races or years using regular subsetting methods.
Below is an example using `dplyr`.

``` r
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
```

``` r

cyclingdata |> 
  filter(race == "Tour de France")
#> # A tibble: 2,383 × 18
#>    race    year stage stage_id stage_num stage_type date       departure arrival
#>    <chr>  <dbl> <chr> <chr>        <int> <chr>      <date>     <chr>     <chr>  
#>  1 Tour …  1903 Stag… 1                1 Road race  1903-07-01 Montgeron Lyon   
#>  2 Tour …  1903 Stag… 2                2 Road race  1903-07-05 Lyon      Marsei…
#>  3 Tour …  1903 Stag… 3                3 Road race  1903-07-08 Marseille Toulou…
#>  4 Tour …  1903 Stag… 4                4 Road race  1903-07-12 Toulouse  Bordea…
#>  5 Tour …  1903 Stag… 5                5 Road race  1903-07-13 Bordeaux  Nantes 
#>  6 Tour …  1903 Stag… 6                6 Road race  1903-07-18 Nantes    Paris  
#>  7 Tour …  1904 Stag… 1                1 Road race  1904-07-02 Paris     Lyon   
#>  8 Tour …  1904 Stag… 2                2 Road race  1904-07-09 Lyon      Marsei…
#>  9 Tour …  1904 Stag… 3                3 Road race  1904-07-13 Marseille Toulou…
#> 10 Tour …  1904 Stag… 4                4 Road race  1904-07-17 Toulouse  Bordea…
#> # ℹ 2,373 more rows
#> # ℹ 9 more variables: parcours_type <chr>, distance <dbl>,
#> #   vertical_meters <dbl>, profile_score <dbl>, startlist_quality <dbl>,
#> #   avg_speed_winner <dbl>, won_how <chr>, win_type <chr>, km_solo <dbl>
```

``` r

cyclingdata |> 
  filter(year == 2023)
#> # A tibble: 120 × 18
#>    race    year stage stage_id stage_num stage_type date       departure arrival
#>    <chr>  <dbl> <chr> <chr>        <int> <chr>      <date>     <chr>     <chr>  
#>  1 Tour …  2023 Stag… 1                1 Road race  2023-07-01 Bilbao    Bilbao 
#>  2 Tour …  2023 Stag… 2                2 Road race  2023-07-02 Vitoria-… San Sé…
#>  3 Tour …  2023 Stag… 3                3 Road race  2023-07-03 Amorebie… Bayonne
#>  4 Tour …  2023 Stag… 4                4 Road race  2023-07-04 Dax       Nogaro 
#>  5 Tour …  2023 Stag… 5                5 Road race  2023-07-05 Pau       Laruns 
#>  6 Tour …  2023 Stag… 6                6 Road race  2023-07-06 Tarbes    Cauter…
#>  7 Tour …  2023 Stag… 7                7 Road race  2023-07-07 Mont-de-… Bordea…
#>  8 Tour …  2023 Stag… 8                8 Road race  2023-07-08 Libourne  Limoges
#>  9 Tour …  2023 Stag… 9                9 Road race  2023-07-09 Saint-Lé… Puy de…
#> 10 Tour …  2023 Stag… 10              10 Road race  2023-07-11 Vulcania  Issoire
#> # ℹ 110 more rows
#> # ℹ 9 more variables: parcours_type <chr>, distance <dbl>,
#> #   vertical_meters <dbl>, profile_score <dbl>, startlist_quality <dbl>,
#> #   avg_speed_winner <dbl>, won_how <chr>, win_type <chr>, km_solo <dbl>
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

## Getting help

If you encounter a clear bug, please file an issue with a minimal
reproducible example on GitHub. You are also more than welcome to shoot
me an email at \[githubusername\]@gmail.com if you have questions or
comments.

## Future releases

I am currently working on adding more races, including monuments and
other major one-day races. I will also add race results and rider info
in the future. Follow updates in the News section.
