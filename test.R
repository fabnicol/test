f <- function(Base) Base[, V := 1]

load("Base3.RData")

library(data.table)  # current build form github dated 18 July

Bulletins.avan4 <- copy(Bulletins.avan3)

identical(Bulletins.avan3, Bulletins.avan4)   # FALSE, thank God

print(Bulletins.avan3)
str(Bulletins.avan3)     # Variables are Matricule and Nir
setDT(Bulletins.avan3)

f(Bulletins.avan3)       # Should add a third variable labelled V

print(Bulletins.avan3)   # No V added !

str(Bulletins.avan4)     # identical to Bulletins.avan3

print(Bulletins.avan4)  

setdiff(Bulletins.avan4, Bulletins.avan3)  # No shallow differences prior to modification by reference in f

f(Bulletins.avan4)       # Should add a third variable labelled V

print(Bulletins.avan4)   # Variable V added !
setdiff(Bulletins.avan4, Bulletins.avan3)  # Confirms

save(Bulletins.avan4, file = "Base4.RData", compress = FALSE, ascii = TRUE, version = NULL)

