# DS210-Project

This project contains the data behind the article "Where Police Have Killed Americans In 2015".

To Read The Article:https://fivethirtyeight.com/features/where-police-have-killed-americans-in-2015/

  Entries come from two sources. The first comes from an organization called the Guardian Media Group. This global news organisation launched an interactive database with info on Americans killed by police in the year 2015. The database, aptly named *The Counted*, was built by combining media coverage, reader submissions, police and coroners' reports, voter registration data, witness testimony, court records, photographs, reliable open-sourced efforts like "Fatal Encounters" and "Killed by Police" as well as its own verification process by comparing it's own reporting with data that has been crowd sourced. 
  
*Note:* The Counted data set info was downloaded on June 2,2015.

For More Information:http://www.theguardian.com/thecounted


  The second set of entries came from census data from the *American Community Survey*. Census data was calculated at the tract level from the 2015 5-year American Community Survey using the tables S0601 (demographics), S1901 (tract-level income and poverty), S1701 (employment and education) and DP03 (county-level income). Census tracts were determined by geocoding addresses to latitude/longitude using the Bing Maps and Google Maps APIs and then overlaying points onto 2014 census tracts.

Each observation represents an individual who has been killed in America during the year 2015. The police_killings data set features 467 observations and 34 Columns.


| Variable                      |  Description
|:----------------|:--------------------------------
|`name`                         | Name of deceased
|`age`                          | Age of deceased
|`gender`                       | Gender of deceased
|`raceethnicity`                | Race/ethnicity of deceased
|`month`                        | Month of killing 
|`day`                          | Day of incident
|`year`                         | Year of incident
|`streetaddress`                | Address/intersection where incident occurred
|`city`                         | City where incident occurred
|`state`                        | State where incident occurred
|`latitude`                     | Latitude, geocoded from address
|`longitude`                    | Longitude, geocoded from address
|`state_fp`                     | State FIPS code
|`county_fp`                    | County FIPS code
|`tract_ce`                     | Tract ID code
|`geo_id`                       | Combined tract ID code
|`county_id`                    | Combined county ID code
|`namelsad`                     | Tract description
|`lawenforcementagency`         | Agency involved in incident
|`cause`                        | Cause of death
|`armed`                        | How/whether deceased was armed
|`pop`                          | Tract population
|`share_white`                  | Share of pop that is non-Hispanic white
|`share_black`                  | Share of pop that is black (alone, not in combination)
|`share_hispanic`               | Share of pop that is Hispanic/Latino (any race)
|`p_income`                     | Tract-level median personal income
|`h_income`                     | Tract-level median household income
|`county_income`                | County-level median household income
|`comp_income`                  | h_income / county_income
|`county_bucket`                | Household income, quintile within county
|`nat_bucket`                   | Household income, quintile nationally
|`pov`                          | Tract-level poverty rate (official)
|`urate`                        | Tract-level unemployment rate
|`college`                      | Share of 25+ pop with BA or higher


*Note:* regarding income calculations:

- All income fields are in inflation-adjusted 2013 dollars.

- `comp_income` is simply tract-level median household income as a share of county-level median household income.

- `county_bucket` provides where the tract's median household income falls in the distribution (by quintile) of all tracts in the county. (1 indicates a tract falls in the poorest 20% of tracts within the county.) Distribution is not weighted by population.

- `nat_bucket` is the same but for all U.S. counties.


