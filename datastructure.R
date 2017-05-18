dbl_var <- c(1,2.5, 4.5)
int_var <- c(1L, 6L, 10L)
log_var <- c(T, F, T, F)
char_var <- c("This are", "some strings")

### Attributes
## Names
# Set name from existing objet:
x <- c(1, 2, 3, 4, 5)
y <- x
names(y) <- c('a', 'b', 'c', 'd', 'e')
# or, directly:
w <- setNames(x, c('a', 'b', 'c', 'd', 'e'))

### Factor
x <- factor(c("a", "b", "c", "b"))
y <- factor(letters[1:5])
levels(x)
# Try to combine factor:
c(x, y) # <- Only combine the index (1 2 3 2 1 2 3 4 5)
# Add New level(s):
levels(x) <- c(levels(x), "d")
table(x) # List the number of factor's level

### Exercices
structure(1:5, comment = 'I am a comment')
attributes(structure(1:5, comment = 'I am a comment'))
str(structure(1:5, comment = 'I am a comment'))
help("structure")
structure(1:4, dim = c(2,2))

## Modify the level avec a factor:
a <- c('a', 'b', 'b')
l <- factor(letters)
levels(l) <- rev(levels(l))

l <- factor(c('a', 'b', 'a'))
levels(l) <- rev(levels(l))

levels(l) <- c('z', 'q')

## factor manipulation
f2 <- rev(factor(letters))
table(f2)

f2 <- rev(factor(c('a', 'b', 'b')))
table(f2)

f3 <- factor(a, levels = c('b', 'a'))
table(f3)

#summary:
f1 <- factor(a)
table(f1) # a: 1 | b: 2
levels(f1) <- rev(levels(f1))
table(f1) # a: 2 | b: 1
## but: 
f2 <- rev(factor(a))
table(f2) # a: 1 | b: 2
## and
f3 <- factor(a, levels = c('b', 'a'))
table(f3) # a: 1 | b: 2 -> No reassignment of level.

# Array and matrices
a <- 1:12
b <- array(a, dim = c(2, 3, 2))
dim(b)
dimnames(b) <- list(c(1:2), c(1:3), c(1:2)) # length must coincide
length(list(1:12))
length(b)

###############
## Exercises ##
###############
dim(1:3)
is.matrix(matrix())
is.array(matrix())
x1 <- array(1:5, c(1, 1, 5))
x2 <- array(1:5, c(1, 5, 1))
x3 <- array(1:5, c(5, 1, 1))

###############
## Combining dataframes
###############
df <- data.frame(x = 1:3,
                 y = LETTERS[1:3])
cdf <- cbind(df, data.frame(z = 3:1))
rdf <- rbind(df, data.frame(x = 10,
                     y = 'z'))
rbind(cdf, data.frame(x = 10,
                      y = 'z'))
# Error: Numbers of columns of arguments do not match
# rdf
rdf
df
library(plyr)
plyr::rbind.fill(df,rdf)
# cbinding vector
vecta <- 1:5
vectb <- letters[1:5]
cbind(vecta, vectb)
typeof(cbind(vecta, vectb))
class(cbind(vecta, vectb)) ## not a dataframe, a matrix
# but by using data.frame:
data.frame(vecta, vectb, stringsAsFactors = F)
class(data.frame(vecta, vectb)) # ok it is now a data.frame

# Special column of dataframe
df <- data.frame(x = 1:3)
# New column type list
df$y <- list(1:2, 1:3, 1:4)

# The following failed even if the statement is very
# close to the previous
# data.frame try to pu each item of the list in its 
# own column
data.frame(x = 1:3, list(1:2, 1:3, 1:4))
# The columns of a data.frame must have same lenght
# So the following work:
df <- data.frame(x = 1:3, list(letters[1:3], 3:1, 5:7))
# it works even if the column names are disgusting!
names(df) <- letters[1:4]
names(df)

# but a workaroud exists:
# instead of:
data.frame(x = 1:3, list(1:2, 1:3, 1:4))
# Use:
dfl <- data.frame(x = 1:3, I(list(1:2, 1:3, 1:4)))
# The list has been treated as a whole.
str(dfl)

# data.frame with matrix:
m <- matrix(1:9, nrow = 3)
# Folowing gives a dataframe with four columns
df <- data.frame(x = LETTERS[5:7], m = m)
dfm <- data.frame(x = LETTERS[5:7], m = I(m))
# how to subset kind of dataframe combining matrices:
str(df)
str(dfm)

dfm[,2] # return a matrix
dfm[,2][2,2] # we can subset the matrix.


















