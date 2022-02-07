# API

library(httr)
library(jsonlite)
library(tidyverse)

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



