# HDS-plumber lecture

## Pre-requisite R libraries

- httr
- jsonlite
- tidyverse
- plumber
- gapminder
- png

You can install missing packages with the following R code:

    # Package names
    packages <- c("httr", "jsonlite", "tidyverse", "plumber", "gapminder", "png")
    
    # Install packages not yet installed
    installed_packages <- packages %in% rownames(installed.packages())
    if (any(installed_packages == FALSE)) {
      install.packages(packages[!installed_packages])
    }

## Session running order

- Lecture: Introduction to APIs
- Exercise 1: Using an API - how many people are in space right now?
- Exercise 2: Using an API - what is the UK Covid-19 case rate?
- Lecture: Introduction to plumber
- Exercise 3: Run example plumber functions (/hello, /square, /plot)
- Exercise 4: Write a plumber function to use gapminder data to show population of the UK in 1982
- Exercise 5: Write a plumber function to allow a user to find out the population of any country during any year in gapminder.
- Exercise 6: Write a plumber function to plot the population change of a user defined country.

## Exercise 1: Using an API - how many people are in space right now?

Run the exercise_1_api_who_is_in_space_now.R script one line at a time (Ctrl-Enter) and read the comments as you go.

## Exercise 2: Using an API - what is the UK Covid-19 case rate?

Write a new R script to get the daily UK Covid-19 case rate and plot it.
You can start with the exercise_1_api_who_is_in_space_now.R file as the basis for this exercise.
The URL you will need to use is:

    https://api.coronavirus.data.gov.uk/v1/data?filters=areaType=nation;areaName=england&structure={"date":"date","newCases":"newCasesByPublishDate"}

If you get really stuck, the answer is in exercise_2_api_covid_answer.R

## Exercise 3: Run example plumber functions (/hello, /square, /plot)

### Server set up

open exercise_3_plumber_example_server.R

In the menu bar above the source code click on "Run API", this will open a web
browser with the swagger interface. Note the URL and port number.

### Explore with swagger

- Click on the "GET /hello say hello" bar.
- Click on the "Try it out" button.
- Click on the "Execute button."
- Look for the Response body and you will see the "Hello world!" text from the R function.
- Explore all three end points (/hello, /square, /plot), making sure you
    understand the corresponding R code.

### Explore with web browser

Swagger is a web tool which calls the API for us and displays the data in an easy
to use way. What happens if we call the API directly from a web browser without
swagger? Paste the URLs from earlier into Chrome/Firefox/etc, they should look
something like (the port will be different):

- 127.0.0.1:3726/hello
- 127.0.0.1:3726/square?a=8
- 127.0.0.1:3726/plot

### Explore with Rstudio

As noted earlier, Swagger is great for exploring APIs, but we want to access our
API in the same way we did at the start of this session via R. To do this start
a second instance of RStudio (either Session > New Session, or navigate in your
OS and click on the RStudio icon). Now we have one RStudio instance acting like
a server (the one with plumber running) and the second RStudio is our client.

In the second RStudio (the client) open exercise_3_plumber_example_client.R.
You may need to edit the IP address and port used in the GET statements to match
what your plumber instance has. Now step through the code, line at a time and
you'll be interacting with example plumber code in the same way you did with the
external APIs we started with (space and Covid-19).

**Example answers to exercises 4,5,6 are in this repo - do not look at them unless you are stuck,
I want you to write your own versions.**

## Exercise 4 - Write a plumber function to use gapminder data to show population of the UK in 1982

The gapminder library has data on countries every 5 years 1952-2007. To look at it run

    > library(gapminder)
    > gapminder

To just look at UK data run

    > gapminder[gapminder$country=="United Kingdom", ]

To look at UK population in the year 1987

    > gapminder[gapminder$country=="United Kingdom" & gapminder$year==1987, "pop"]

In a new file, write a plumber function to return the number of people in the UK
in 1982. It might be helpful to base it on the code in
exercise_3_plumber_example_server.R file.

To run it you will need to stop the current plumber instance running - in the
console window (below the code window) press the red stop button at the top.
Then to start plumber again press the Run API button at the top. This will start
swagger again so you can test it. You will need to do this every time you edit
the plumber code.

Write some code to connect to your new endpoint to retrieve the data in the
client RStudio you have running. It might be helpful to base this on the code in
exercise_3_plumber_example_client.R

## Exercise 5: Write a plumber function to allow a user to find out the population of any country during any year in gapminder

Write a new plumber function to return the population of any country (as
supplied by a user) in any year (as supplied by the user), and run it.

Connect to it from the client RStudio and find out the population of Afghanistan
in 1982. Remember the format of the query part of URLs - ?variableA=1&variableB=2

## Exercise 6: Write a plumber function to plot the population change of a user defined country

Write a new plumber function to return a plot of the population of a user
supplied country for all available dates.

Connect to it from the client RStudio and plot the population of Afghanistan.
