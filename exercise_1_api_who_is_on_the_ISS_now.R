################################################################################
# exercise 1 API - Who is on the International Space Station right now?
# Run this file one line at a time (Ctrl - Enter).
################################################################################

library(httr)             # Needed for request/response with API
library(jsonlite)         # Needed to decode the response data from the API

# Send request to the API and get a response back
response = GET('http://api.open-notify.org/astros.json')

# Print the response.
response

# This is actually just some header info. Note the "Status: 200" line, which 
# tells us the request/response executed successfully. 
# We can also see the "Content-Type: application/json" line which tells us the
# format of the returned data.

# Look at the Environment tab to see what else is in the response object (click 
# on the blue arrow next to "response"). There is a lot of metadata in here 
# telling us how the request/response went, what time it happened etc. We are
# only really interested in the content section.

# Print the the content section of the response
response$content

# But the content is in binary, so convert the response to an R data object
content = fromJSON(rawToChar(response$content))

# Print the data. Note that it is a list with 3 items (message, number, people)
content

# Print out just the people.
content$people

# Now you know who is on the International Space Station right now!



