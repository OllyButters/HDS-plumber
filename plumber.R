
library(plumber)

setwd("/home/olly/git/HDS-plumber")


pr("my_plumber_functions.R") %>%
  pr_run(port=8000)


# In a browser
# http://localhost:8000/plot