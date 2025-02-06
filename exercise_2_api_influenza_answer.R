##########################################
# exercise 2 API influenza ANSWER
##########################################

library(httr)
library(jsonlite)

# UK Health Security Agency (UKHSA) API
response = GET('https://api.ukhsa-dashboard.data.gov.uk/themes/infectious_disease/sub_themes/respiratory/topics/Influenza/geography_types/Nation/geographies/England/metrics/influenza_healthcare_hospitalAdmissionRateByWeek?age=all&page=2&page_size=365')

# Check the status of the response
response$status_code

# Get the content from the response
content = fromJSON(rawToChar(response$content))

# Look at the actual data. Note how it is called results.
content$results

# Plot the data
x=as.POSIXct(content$results$date)
y=content$results$metric_value
plot(x, y, xlab="Date", ylab="per 100,000", main="Weekly hospital admissions for influenza in England")#, type="l", col="blue", lwd=2)

# Check to see if your results match the data on the website
# https://ukhsa-dashboard.data.gov.uk/respiratory-viruses/influenza?areaType=Nation&areaName=England


