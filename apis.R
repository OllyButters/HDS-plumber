# Prerequisites:

#install.packages("httr")
#install.packages("jsonlite")


# Bioontology needs an API key
# Good list of public APIs - https://github.com/public-apis/public-apis

# API

library(httr)
library(jsonlite)
library(tidyverse)

##########################################
# How many people are in space right now?

# Query the API
response = GET("http://api.open-notify.org/astros.json")

# Look at the response
response

# Convert the response to R data object
fromJSON(rawToChar(response$content))


# Something with query parameters?


##########################################
# UK corona virus data
# https://api.coronavirus.data.gov.uk/v1/data

response = GET('https://api.coronavirus.data.gov.uk/v1/data?filters=areaType=nation;areaName=england&structure={"date":"date","newCases":"newCasesByPublishDate"}')
content = fromJSON(rawToChar(response$content))
content$data

# Plot the data
gg <- ggplot(data=content$data, mapping = aes(x=as.POSIXct(date), y=newCases)) +
  geom_point(color="blue") +
  xlab("Date")
plot(gg)

# Use in analysis, web pages, home automation, whatever.



