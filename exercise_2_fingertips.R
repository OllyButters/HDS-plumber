library(httr)
library(jsonlite)

#####
# Fingertips data. Can't get this to work easily.
# https://fingertips.phe.org.uk/api#/
#response = GET('https://fingertips.phe.org.uk/api/profiles_containing_indicators?indicator_ids=91736')


#####
# NHSBSA data. Can't get this to work easily.
#https://github.com/nhsbsa-data-analytics/open-data-portal-api/blob/master/open-data-portal-api.R
#response = GET('https://opendata.nhsbsa.net/api/3/action/datastore_search_sql?resource_id=EPD_202001')

#https://opendata.nhsbsa.net/dataset/english-prescribing-data-epd/resource/b927fcd2-ecd8-42d7-a4d3-7428a111a374

#response = GET('https://opendata.nhsbsa.net/api/3/action/datastore_search?resource_id=EPD_202405&limit=5&filters={"ICB_CODE":"QHM"}')
#response = GET('https://opendata.nhsbsa.net/api/3/action/datastore_search?resource_id=EPD_202405')
#temp = URLencode("SELECT * FROM EPD_202405 LIMIT 5")
#response = GET('https://opendata.nhsbsa.net/api/3/action/datastore_search_sql?resource_id=EPD_202405&sql="SELECT%20*%20FROM%20EPD_202405%20LIMIT%205"')

# UKHSA
# https://ukhsa-dashboard.data.gov.uk/metrics-documentation?search=
# https://ukhsa-dashboard.data.gov.uk/respiratory-viruses/influenza?areaType=Nation&areaName=England
#response = GET('https://api.ukhsa-dashboard.data.gov.uk/themes/infectious_disease/sub_themes/respiratory/topics/COVID-19/geography_types/Nation/geographies/England/metrics/COVID-19_testing_PCRcountByDay?page_size=365')
response = GET('https://api.ukhsa-dashboard.data.gov.uk/themes/infectious_disease/sub_themes/respiratory/topics/Influenza/geography_types/Nation/geographies/England/metrics/influenza_healthcare_hospitalAdmissionRateByWeek?age=all&page=2&page_size=365')

response

response$content

# Get the content from the response
content = fromJSON(rawToChar(response$content))

content

# Look at the actual data
content$data


# Plot the data
x=as.POSIXct(content$results$date)
y=content$results$metric_value
plot(x, y, xlab="Date", ylab="per 100,000", main="Weekly hospital admissions for influenza in England")#, type="l", col="blue", lwd=2)



