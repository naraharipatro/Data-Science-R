m <- matrix(data = 1:6,
            nrow = 2,
            ncol = 3)

a <- array(
  data=1:8,
  dim = c(2,2,2)
)

#list - for  heterogeneous types

l <- list(TRUE, 123L, 2.34, "abc")

# v.imp -> dataframe

df <- data.frame(
  Name = c("Cat","Dog","Cow"),
  Howmany = c(5,10,4),
  IsPet = c(TRUE, TRUE, TRUE)
)
df

#R is a vectorized language
1 + 2
c(1,2,3) + c(4,5,6)

#installing packages
install.packages("dplyr")

#loading packages
library("dplyr")

#help
?data.frame
