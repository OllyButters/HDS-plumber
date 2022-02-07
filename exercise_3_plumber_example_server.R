##########################################
# exercise 3 plumber example
# run this code to see plumber in action
##########################################

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
