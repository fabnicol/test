
library(compiler)
library(data.table)


minimal_test <- function(jitlevel) {

  invisible(enableJIT(jitlevel))

  B <- data.table(V = c("a", "b"), W = c("d", "e"))                            
  
  
  f <- function(Base)    Base[ , Y := 1]
  
  
  g <- function() {
    
    Case1 <<-  unique(B, by = NULL)
    
    f(Case1)
    cat("g : using global assignment for Case1\n")  
    print(Case1)
    
  }
  
  
  
  h <-function() {
    
    Case2 <-  unique(B, by = NULL)
    
    f(Case2)
    cat("h : using local assignment for Case2\n")  
    print(Case2)
    
  }
  
  g()
  
  h()
}
  

# NOTES :   
# the issue disappears if unique() is not used (comment out line 18 and replace Case1 by B).
# or if a version of unique is chosen prior to commit cda73





