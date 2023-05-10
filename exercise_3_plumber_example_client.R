################################################################################
# exercise 3 connect to plumber example.
# connect to the plumber API running in the other RStudio instance.
# Note the IP address and ports used below - you will have to update them to
# match where your plumber is running
################################################################################


library(httr)
library(jsonlite)
library(png)

port_number = 3726

#####
# Hello endpoint
hello_response = GET("http://127.0.0.1", port=port_number, path="hello")

# Look at the response.
hello_response

# We want the content
hello_response$content

# But the content is in binary, so convert the response to R data object
hello_data = fromJSON(rawToChar(hello_response$content))

hello_data


#####
# square endpoint
# Note how we are passing a parameter to it
square_response = GET("http://127.0.0.1", port=port_number, path="square", query="a=5")

# Look at the response.
square_response

# We want the content
square_response$content

# But the content is in binary, so convert the response to R data object
square_data = fromJSON(rawToChar(square_response$content))

square_data

#####
# plot endpoint

plot_response = GET("http://127.0.0.1", port=port_number, path="plot")

# Look at the response.
plot_response

# We want the content
plot_response$content

# Our content is a png image
plot_img <- readPNG(plot_response$content)
grid::grid.raster(plot_img)

