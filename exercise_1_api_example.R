##########################################
# exercise 1 API example
# How many people are in space right now?
# Run this line at a time.
##########################################

library(httr)
library(jsonlite)


# Query the API
response = GET("http://api.open-notify.org/astros.json")

# Look at the response.
response

# This is actually just some header info. Look at the Environment tab to see what
# else is in the response object.

# We want the content
response$content

# But the content is in binary, so convert the response to R data object
data = fromJSON(rawToChar(response$content))

# Look at the data. Note it is a list.
data

# Just get the list of people.
data$people

