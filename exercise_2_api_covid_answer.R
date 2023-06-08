##########################################
# exercise 2 API covid ANSWER
##########################################


library(httr)
library(jsonlite)

##########################################
# UK coronavirus data
# https://api.coronavirus.data.gov.uk/v1/data

response = GET('https://api.coronavirus.data.gov.uk/v1/data?filters=areaType=nation;areaName=england&structure={"date":"date","newCases":"newCasesByPublishDate"}')

# Get the content from the response
content = fromJSON(rawToChar(response$content))

# Look at the actual data
content$data

# Plot the data
x=as.POSIXct(content$data$date)
y=content$data$newCases
plot(x, y, xlab="Date", ylab="New cases", main="Covid-19 case rate in England")




