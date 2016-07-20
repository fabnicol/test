
library(compiler)
library(data.table)


minimal_test <- function(jitlevel) {

  invisible(enableJIT(jitlevel))

  B <- data.table(V = c("a", "b"), W = c("d", "e"))                            
  
  
  f <- function(Base)    Base[ , Y := 1]
  
  
  g <- function() {
    
    B <<-  unique(B, by = NULL)
    
    f(B)
    cat("g : using global assignment for B")  
    print(B)
    
  }
  
  
  
  h <-function() {
    
    B <-  unique(B, by = NULL)
    
    f(B)
    cat("h : using local assignment for B")  
    print(B)
    
  }
  
  g()
  
  h()
}
  

# NOTES :   
# the issue disappears if unique() is not used (comment out line 18)  
# or if a version of unique is chosen prior to commit cda73





