########################################
# exercise 3 connect to plumber example.
# connect to the plumber API running in the other RStudio instance.
# Note the IP address and ports used below - you will have to update them to
# match where your plumber is running
########################################

library(httr)
library(jsonlite)
library(png)

#####
# UK endpoint

uk_response = GET("http://127.0.0.1:4342/UK_pop_1982")

# Look at the response.
uk_response

# We want the content
uk_response$content

# But the content is in binary, so convert the response to R data object
uk_data = fromJSON(rawToChar(uk_response$content))

uk_data


#####
# population endpoint
# Note how we are passing a parameter to it
pop_response = GET("http://127.0.0.1:4342/pop?country=Afghanistan&year=1982")

# Look at the response.
pop_response

# We want the content
pop_response$content

# But the content is in binary, so convert the response to R data object
pop_data = fromJSON(rawToChar(pop_response$content))

pop_data

#####
# plot endpoint

pop_change_response = GET("http://127.0.0.1:4342/pop_change?country=Afghanistan")

# Look at the response.
pop_change_response

# We want the content
pop_change_response$content

# Our content is a png image
pop_change_img <- readPNG(pop_change_response$content)
grid::grid.raster(pop_change_img)

