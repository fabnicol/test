
library(data.table)
g <- function(Base) Base[ , Y := 1]

B <- data.table(c("a", "a"))

f_global <- function() { A <<- unique(B, by = NULL) }

f_global()

g(A)
print(A)  #  No variable Y !

f_local <- function() { 
  A <- unique(B, by = NULL)
  A
}

A <- f_local()
g(A)
print(A)   # Y is now back

f_global_sanitized <- function() {
  A <<- unique(B, by = NULL)
  setDT(A)
}

f_global_sanitized()

g(A)      # Y has been sanitized back by setDT
A
