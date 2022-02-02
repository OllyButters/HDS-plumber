
library(httr)
library(jsonlite)
library(tidyverse)

##########################################
# How many people are in space right now?

# Query the API
response = GET("http://localhost:4176/echo?msg=help")

# Look at the response
response

# Convert the response to R data object
fromJSON(rawToChar(response$content))
