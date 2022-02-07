# HDS-plumber lecture

## Pre-requisiste R libraries

httr
jsonlite
#tidyverse
plumber
gapminder

## Running order

- Lecture: Introduction to APIs
- Exercise 1: Using an API - how many people are in space right now?
- Exercise 2: Using an API - what is the UK Covid-19 case rate?
- Lecture: Introduction to plumber
- Exercise: Build own plumber APIs

## Exercise 1: Using an API - how many people are in space right now?

Run the api_example.R script line at a time and follow the comments.

## Exercise 2: Using an API - what is the UK Covid-19 case rate?

Write a new R script to get the daily UK Covid-19 case rate and plot it.
You can start with the api_example.R file as the basis for this exercise. 
The URL you will need to use is:

https://api.coronavirus.data.gov.uk/v1/data?filters=areaType=nation;areaName=england&structure={"date":"date","newCases":"newCasesByPublishDate"


