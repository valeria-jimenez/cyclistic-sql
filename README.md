# Table of Contents
1. [Introduction](https://github.com/valeria-jimenez/cyclistic-python?tab=readme-ov-file#introduction)
2. [Task](https://github.com/valeria-jimenez/cyclistic-python?tab=readme-ov-file#task)
3. [Data](https://github.com/valeria-jimenez/cyclistic-python?tab=readme-ov-file#data)
4. [Data Processing and Cleaning](https://github.com/valeria-jimenez/cyclistic-python?tab=readme-ov-file#data-processing-and-cleaning)
6. [Recommendations](https://github.com/valeria-jimenez/cyclistic-python?tab=readme-ov-file#recommendations)

# Introduction
* This case study is a part of the Google Data Analytics Course Capstone, originally based on [this case study](https://artscience.blog/home/divvy-dataviz-case-study).
* Cyclistic is a Chicago-based bike share company with about 4 million customers. In order to increase revenue, they sought to maximize annual memberships.

# Task
* The goal of this analysis was to find out how members differ from casual (non-annual members) riders in order to convert casual riders to members and increase revenue.

# Data
* The data is provided by Google as part of the Google Data Analytics Certification course. It has bike-share information from January 2021 to December 2021.

# Data Processing and Cleaning
* Data was imported into DBeaver for analysis using SQLite.
* The 12 tables were consolidated, along with newly created features, using [this query](https://github.com/valeria-jimenez/cyclistic-sql/blob/main/compile_add_features.sql).
* The columns were checked with [this query](https://github.com/valeria-jimenez/cyclistic-sql/blob/main/check_columns.sql), and problematic columns were removed with [this query](https://github.com/valeria-jimenez/cyclistic-sql/blob/main/check_ride_duration.sql).

# Recommendations
1. Tap into different types of riders
  1. Commuter Membership
     * Targets existing members and potential members
     * Offer priority usage morning and evening rush hour

  2. Recreational Membership
     * Offer priority usage during weekends
     * Introduce special rates or promotions for weekend rides
     * Allow users to bring friends on rides at reduced rates (since use is mostly recreational, it could be likely that users typically ride with others)

2. Tap into seasonality in ridership
* Introduce incentives (ex. discounted membership) for users who sign up to be members during the low season
