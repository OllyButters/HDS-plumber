#######################################
# Exercises 4-7 plumber ANSWERS

###################################

library(gapminder)

# Exercise 4

#* Population of the UK in 1982
#* @get /UK_pop_1982
function() {
  gapminder[gapminder$country=="United Kingdom" & gapminder$year==1982, "pop"]
}

# Exercise 5

#* Population of any country anytime
#* @param country country name
#* @param year The year (1952 - 2007 in steps of 5)
#* @get /pop
function(country, year) {
  gapminder[gapminder$country==country & gapminder$year==year, "pop"]  
}


# Exercise 6

#* Plot population change over time
#* @serializer png
#* @param country country name
#* @get /pop_change
function(country) {
  options(scipen=999) # Change number format on axes so not scientific
  plot(gapminder[gapminder$country==country, c("year", "pop")], xlab="Year", ylab="Population")
}
