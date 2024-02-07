################################################################################
# exercise 3 plumber example
# run this code by clicking on the "Run API" button on the top right. This will
# open a web browser with swagger running
################################################################################

library(plumber)
options("plumber.port" = 5555)

#* Say hello
#* @get /hello
function() {
  print("Hello world!")
}


#* Return the square of a number
#* @param a The number to square
#* @get /square
function(a) {
  as.numeric(a) * as.numeric(a)
}


#* Plot a histogram
#* @serializer png
#* @get /plot
function() {
  rand <- rnorm(100)
  hist(rand)
}
