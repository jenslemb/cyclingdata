# A comprehensive dataset on stage-races in professional cycling

A comprehensive dataset on race-level information of all Grand Tours and
major one-week stage races in professional cycling.

## Usage

``` r
cyclingdata
```

## Format

A data frame with 11,125 rows and 18 columns:

- race:

  Race name.

- year:

  Year.

- stage:

  Stage name.

- stage_id:

  Stage ID extracted from stage name (e.g., prologue, 1, 2a, 2b).

- stage_num:

  Stage number in order of completion within a given race (e.g.,
  prologue, stage 1, stage 2a, stage 2b are assigned 1, 2, 3, 4,
  respectively).

- stage_type:

  Stage type (Prologue, Road race, ITT, or TTT).

- date:

  Date of race. Format: `YYYY-MM-DD`.

- departure:

  Location of departure.

- arrival:

  Location of arrival.

- parcours_type:

  Stage profile type. (Hills uphill finish, Hills flat finish, Flat,
  Mountains flat finish, Mountains uphill finish).

- distance:

  Race length in kilometers.

- vertical_meters:

  Number of vertical meters.

- profile_score:

  Numeric value of race difficulty. See:
  <https://www.procyclingstats.com/info/profile-score-explained>

- startlist_quality:

  Numeric value of the quality of riders at the start of the race. See:
  <https://www.procyclingstats.com/calendar/uci/startlist-quality%3E>

- avg_speed_winner:

  Average speed of winner in km/h.

- won_how:

  Description of how the race was won.

- win_type:

  Category of win type (Solo, Sprint à deux, Large group sprint, Small
  group sprint, Unknown type). Small group sprint refers to all sizes of
  reduced pelotons. Refer to `won_how` for more details on group size.

- km_solo:

  Length of winning solo attack (only applies to solo wins).

## Source

<https://www.procyclingstats.com>
