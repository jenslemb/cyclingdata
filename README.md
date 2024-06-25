
## Overview

The `cyclingdata` package presents a comprehensive dataset on major
stage races in professional cycling. The data includes 11,125 stages
over the past 120 years from all three Grand Tours (Tour de France, Giro
d’Italia, La Vuelta Ciclista a España) in addition to Critérium du
Dauphiné, Itzulia Basque Country, Paris-Nice, Tirreno-Adriatico, Tour de
Pologne, Tour de Romandie, Tour de Suisse, and Volta Ciclista a
Catalunya. (Source: <https://www.procyclingstats.com>)

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
`cyclingdata`. You can find more info about the data in the *reference
section*

``` r
library(cyclingdata)

cyclingdata
```

#### Select races or years

You can subset data using regular methods. Below is an example using
`dplyr`.

``` r
library(dplyr)

cyclingdata |> 
  filter(race == "Tour de France")

cyclingdata |> 
  filter(year == 2023)
```

### Scraping data

`cyclingscraper()` allows you to scrape race data directly from
<https://www.procyclingstats.com>. You can request multiple races and
years. Please see the reference section for more details about accepted
arguments.

``` r
cyclingscraper(races = c("tdf", "giro", "vuelta"), years = 2022:2023)
```

## Getting help

If you encounter a clear bug, please file an issue with a minimal
reproducible example on GitHub. You are also more than welcome to shoot
me an email at \[githubusername\]@gmail.com if you have questions or
comments.

## Future releases

I am currently working on adding more races, including monuments and
other major one-day races. I will also add race results and rider info
in the future. Follow updates in the News section.
