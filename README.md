
# Introduction

The `cyclingdata` package contains two main components that enables
users to access and analyze data on professional cycling:

1.  A comprehensive dataset (`cyclingdata`) on stage-level information
    on 11,125 stages across 120 years of cycling. The dataset comprises
    all Grand Tours and most major one-week stage races in professional
    cycling.

2.  A function (`cyclingscraper`) that allows users to harvest data on
    professional cycling. The function accesses the requested race on
    <https://www.procyclingstats.com> and converts the HTML code to a
    dataframe containing stage-level information.

The following sections will present an overview of contents of the
package and how to install and use it.

## About the data

`cyclingdata` presents a comprehensive dataset on major stage races in
professional cycling scraped from <https://www.procyclingstats.com>. The
following races are included:

- Tour de France
- Giro d’Italia
- La Vuelta Ciclista a España
- Critérium du Dauphiné
- Itzulia Basque Country
- Paris-Nice
- Tirreno-Adriatico
- Tour de Pologne
- Tour de Romandie
- Tour de Suisse
- Volta Ciclista a Catalunya
- … more to come (see *Future releases* below)

The dataset includes 11,125 stages between 1903 and 2024 and contains a
range of stage characteristics and how the stage was won (assuming it’s
completed). See the function reference for `cyclingdata` for more
information about the data.

## Installation

``` r
# Install the development version from GitHub
devtools::install_github("jenslemb/cyclingdata")
```

## Usage

### Loading data

You can access the data simply by loading the package and calling
`cyclingdata`. The entire dataset of all races and years are loaded by
default.

``` r
library(cyclingdata)

cyclingdata
```

#### Select races or years

You can subset data using common methods. Below is an example using
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
years. Please see the function reference for more details about accepted
arguments.

``` r
cyclingscraper(races = c("tdf", "giro", "vuelta"), years = 2022:2023)

cyclingscraper(races = c("tdf", "giro", "vuelta"), years = "all")
```

## Getting help

If you encounter a clear bug, please file an issue with a minimal
reproducible example on GitHub. You are also more than welcome to shoot
me an email at <jenslemb@gmail.com> if you have questions or comments.

## Future releases

I am currently working on adding more races, including monuments and
other major one-day races. I will also add race results and rider info
in the future. Follow updates in the changelog.
