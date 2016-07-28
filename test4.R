
library(compiler)
library(data.table)

new_test <- function(jitlevel) {

  enableJIT(jitlevel)
  setCompilerOptions(optimize = 3)
  B <- data.table(V = c("a", "b"), W = c("d", "c"))                            
  f <- function(Base)    Base[ , Y := 1]
  
  Y <- NULL

  g <- function() {

    cat("Case 1  Assign to parent frame\n")    
    
    invisible(assign("Case1", unique(B, by = NULL), envir = parent.frame()))

    f(Case1)

    print(Case1)

    cat("Case 2 Reminder of issue with global <<- \n")    

    Case2 <<- unique(B, by = NULL)

    f(Case2)

    print(Case2)
    
  }
  
  g()
  
}
  

  
# No compiler
new_test(0)

# Compiler set on
new_test(1)


#### Please restart R here and run following

library(compiler)
library(data.table)

new_test_alloc <- function(jitlevel) {
  B <- data.table(V = c("a", "b"), W = c("d", "c"))                            
  f <- function(Base)    Base[ , Y := 1]
  
  cat("Case 3 Cure with alloc.col \n")    
  
  Case3 <<- unique(B, by = NULL)
  
  alloc.col(Case3)
  
  f(Case3)
  
  print(Case3)
  
}

new_test_alloc(1)


# NOTES :   
# the issue disappears if unique() is not used
# or if a version of unique is chosen prior to commit cda73





