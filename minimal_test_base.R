
  
  source("test3.R", encoding = "ISO-8859-1")
  
  minimal_test(0)
  
  .Last <- function() system("R")
  q(save="no")

  source("test3.R", encoding = "ISO-8859-1")
  
  minimal_test(1)
  
  .Last <- function() system("R")
  q(save="no")
  
  source("test3.R", encoding = "ISO-8859-1")
  
  minimal_test(2)
  
  .Last <- function() system("R")
  q(save="no")
  
  source("test3.R", encoding = "ISO-8859-1")
  
  minimal_test(3)
  
  .Last <- function() system("R")
  q(save="no")
  
