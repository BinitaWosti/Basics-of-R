#<- (to assign data to variables)
x <- 1
x<-1
x < -1
(X <- -1) 
#X == x (R is case sensitive)
#X != x (R is case sensitive)
X == x 
X != x
# x <- "one" (example)
x <- "one"
x <-"Binita"
#x <-1.0 (types of data-examples-numeric,integer, characters, logical, complex)
x <- 1.0
x <- 1L
x <- "one"
x <- "Binita"
x <- TRUE
y <- FALSE
x <- 1+1i 
#vec <- c(1,2,3,4)- For types of data structure-vector
vec <- c(1,2,3,4)
vec
vec <- 1:4
#matrix <- matrix (vector, nrow = 2, ncol = 2)- For matrix
matrix <- matrix (vec, nrow = 2, ncol = 2)
matrix
#df <- data.frame(id = c("A","B","C","D"), values = vector)- for data frames
df <- data.frame(id = c("A","B","C","D"), values = vec)
df
#df <- data.frame(Height = c("A","B","C","D"), values = vector)- to give name to the id
df <- data.frame(Height = c("A","B","C","D"), values = vector)
#View (df) - to view df (tye capital V)
View (df)
#View (matrix) - to view matrix 
View (matrix)
#num_vec <- numeric(5)- to create empty vectors
num_vec <- numeric(5)
#num_vec <- c(1,2,3,4)- to fill vectors
num_vec <- c(1,2,3,4)
#num_vec[5] <- 5- to fill vectors
num_vec[5] <- 5
num_vec
#num_vec[3] <- num_vec[5]- to assign new value to a vector
num_vec[3] <- num_vec[5]
num_vec
num_vec [5] <- 3
num_vec
#num_vec [5] <- 5 - to reverse it
num_vec [5] <- 5
num_vec
#num_vec[11 <- 11]- created numeric vectors of length 11
num_vec[11 <- 11]
num_vec [11] <-11
num_vec
num_vec [6] <- 6
num_vec
num_vec [7] <- 7
num_vec [8] <- 8
num_vec [9] <- 9
num_vec [10] <- 10
num_vec [11] <-11
num_vec
num_vec[3]
num_vec[3] <- num_vec[5]
num_vec
num_vec[5] <- num_vec[3]
num_vec
num_vec [5] <- 3
num_vec
num_vec [3] <- 3
num_vec
#cha_vec <- c("this", "is", "a", "vector")- created a vector using c()
cha_vec <- c("this", "is", "a", "vector")
#cha_vec[c(1,4)]- access multiple indices of vector
cha_vec[c(1,4)]
cha_vec <- c("Binita", "is", "a", "student")
cha_vec[c(1,4)]
cha_vec[c(1,4)]
cha_vec[c(1,11)]
cha_vec[c(1,5)]
cha_vec[c(1,3)]
cha_vec[c(1,1)]
cha_vec[c(1,2)]
cha_vec[c(1,4)]
#names(num_vec) <-c("first", "second", "third", "fourth", "fifth")-naming the vectors
names(num_vec) <-c("first", "second", "third", "fourth", "fifth")
names(num_vec) <-c("Binita", "is", "a", "grad", "student")
names(num_vec) <-c("first", "second", "third", "fourth", "fifth")
#num_vec[c("second","fourth")]- access indices by name
num_vec[c("second","fourth")]
num_vec[c("Binita","is")]
num_vec[c("second","fourth")]
#Practice
vector <- c(1,2,3,4,5,6,7)
cha_vec <- c("Binita", "is", "a", "2nd", "semester", "grad", "student")
num_vec
names(num_vec) <-c("Binita", "is", "a", "2nd", "semester", "student")
(new_vec <- num_vec[c(1,3,5)])
(new_vec2 <- names(new_vec))
#maths and vectors
(2+5)*(5-2)
sqrt(64)
log(3)
Leaf_area <- c(2.5, 1.6, 2.2, 2.6)
Leaf_mass <- c(22, 15, 20, 24)
mean(Leaf_area)
mean(Leaf_mass)
(LMA <- Leaf_mass/Leaf_area)
mean(LMA)
