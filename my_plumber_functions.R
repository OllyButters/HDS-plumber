# Prerequisites:

# install.packages("plumber")
# Note: plumber needed sodium installed on my linux machine
# https://github.com/jeroen/sodium
# sudo apt-get install -y libsodium-dev

# install.packages("gapminder")

#########################################

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

#######################################
# Exercises
# Gapminder has data on countries every 5 years 1952-2007.
# > gapminder to look at it.
# > gapminder[gapminder$country=="United Kingdom", ] to see all UK data 


# 1 - Write a plumber function to use gapminder data to show population of the UK in 1982
# 2 - Write a plumber function to allow a user to find out the population of any country during any year in gapminder.
# 3 - Write a plumber function to plot the population change of a user defined country.
# 4 - connect to an external API and show the data.


###################################
# Answers

# 1

library(gapminder)

#* Population of the UK in 1982
#* @get /UK_pop_1982
function() {
  gapminder[gapminder$country=="United Kingdom" & gapminder$year==1982, "pop"]
}

# 2

#* Population of any country anytime
#* @param country country name
#* @param year The year (1952 - 2007 in steps of 5)
#* @get /pop
function(country, year) {
  gapminder[gapminder$country==country & gapminder$year==year, "pop"]  
}


# 3

#* Plot population change over time
#* @serializer png
#* @param country country name
#* @get /pop_change
function(country) {
  options(scipen=999) # Change number format on axes so not scientific
  plot(gapminder[gapminder$country==country, c("year", "pop")], xlab="Year", ylab="Population")
}



