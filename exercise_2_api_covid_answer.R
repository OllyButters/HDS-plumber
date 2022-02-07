##########################################
# exercise 2 API covid ANSWER
##########################################


library(httr)
library(jsonlite)
library(tidyverse)

##########################################
# UK corona virus data
# https://api.coronavirus.data.gov.uk/v1/data

response = GET('https://api.coronavirus.data.gov.uk/v1/data?filters=areaType=nation;areaName=england&structure={"date":"date","newCases":"newCasesByPublishDate"}')

# Get the content from the response
content = fromJSON(rawToChar(response$content))

# Look at the actual data
content$data

# Plot the data
gg <- ggplot(data=content$data, mapping = aes(x=as.POSIXct(date), y=newCases)) +
  geom_point(color="blue") +
  xlab("Date")
plot(gg)

