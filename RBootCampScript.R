##### EEB R Bootcamp Script #####
## By Alec Baird September 2017

## Sections 9.1 - 9.3, 9.6, 11, 12

######### 9.1 Vectors
# Vector = 1 dimensional array of values
# mode() = type of values in the vector
# length() = number of values in the vector

### 9.1.0.0.1 Exercise
### What do the %% and %/% operators do?
# %% = modulus, remainder from division
# %/% = integer division (without remainders or decimels)
#Example:
x <- 4
y <- 6
y%%x # Answer = 2 because 6 divided by 4 has a remaineder of 2
y%/%x # Answer = 1 because 6 divided by 4 is 1.5 (but no decimels or remainder!)

######### 9.1.1 Element Recycling
# When two vectors are of unequal length, the shorter vector's elements
# are recyclyed until the length of the vector equals that of the
# long vector

### 9.1.1.0.1 Exercise
### What happens when the length of the longer vector is not a
### multiple of that of the shorter?
# Elements are recycled until the length of the longer vector
# is finished in the order of the shorter vector
#Example:
x <- c(1,3,5,7)
y <- c(1,2,3,4,5,6,7,8,9,10)

x + y # yields: 2  5  8 11  6  9 12 15 10 13

######### 9.1.2 Functions for Creating Vectors
# seq() creates a vector of regularly spaced values: seq(from, to, by)

### 9.1.2.0.1 Exercise
# Use seq to create the vector v=(1 5 9 13), and to create a vector going 
# from 1 to 5 in increments of 0.2 .

v <- seq(1,13,4)
v

w <- seq(1,5,0.2)
w

### 9.1.2.0.2 Exercise
# What happens when to is less than from in seq? What result 
# does 3:1 give? This is one of the first “gotchas” R newbies run into.

z <- seq(3,1)
z
## Useful functions for working with vectors
# seq(from,to,by=1)	Vector of evenly spaced values (default increment = 1)
# seq(from,to,length.out)	Vector of evenly spaced values, specified length
# c(u,v,...)	Combine a set of numbers and/or vectors into a single vector
# rep(a,b)	Create vector by repeating elements of  a b times each
# hist(v)	Histogram plot of value in v
# mean(v),var(v),sd(v)	Estimate of population mean, variance, standard deviation based on data values in  v
# cov(v,w)	Covariance between two vectors
# cor(v,w)	Correlation between two vectors

######### 9.1.3 Vector Indexing
# Extracting a specific entry of a vector utilizes brackets: []

z <- c(1,3,5,7,9,11)
z[3]

### 9.1.3.0.1 Exercise
# If you enter v <- z[seq(1,5,2)], what will happen? 
# Make sure you understand why.

v <- z[seq(1,5,2)]
v # This returns:1, 5, 9 because it's extracting from elements 1 to 5, but by 2 or every other element

### 9.1.3.0.2 Exercise
# Write a one-line command to extract a vector consisting of the second, 
# first, and third elements of z in that order.

a <-z[c(2,1,3)]
a

### 9.1.3.0.3 Exercise
# What happens when I set the value of an element that doesn’t exist? 
# For example, try z[9] <- 11
z[9] <- 11
z[9]

### 9.1.3.0.4 Exercise
# Write code that computes values of y=(x−1)/(x+1) 
# for x=1,2,⋯,10x=1,2,⋯,10, and plots yy versus xx with the 
# points plotted and connected by a line.

x <- c(1:10)
y <- (x-1)/(x+1)
plot(x~y)
lines(x~y)

plot(y~x)
lines(y~x)

### 9.1.3.0.6 Exercise
# The sum of the geometric series 1+r+r2+r3+...+rn1+r+r2+r3+...+rn 
# approaches the limit 1/(1−r) for r<1 as n→∞n→∞. 
# Take r=0.5 and n=10, and write a one-line command 
# that creates the vector G=(r0,r1,r2,...,rn).
# Compare the sum (using sum()) of this vector to the limiting value
# 1/(1−r)1/(1−r). Repeat for n=50.

r <- 0.5
n <- 10

g <- seq()
x <- 1/(1-r)

### 9.1.4 Logical operations
# R code	comparison
# x < y	xx strictly less than yy
# x > y	xx strictly greater than yy
# x <= y	xx less than or equal to yy
# x >= y	xx greater than or equal to yy
# x == y	xx equal to yy
# x != y	xx not equal to yy
# identical(x,y)	xx completely identical to yy
# all.equal(x,y)	xx pretty much equal to y

# Logical Operators
# operator	meaning
# !	logical NOT
# &	logical AND, elementwise
# &&	logical AND, first element only
# |	logical OR, elementwise
# ||	logical OR, first element only
# xor(x,y)	exclusive OR, elementwise

### 9.1.5 More on Vector Indexing

# 9.1.5.0.1 Exercise
# What would happen if instead of setting lowLight
# you replaced Light by saying  Light <- Light[Light<50]? 
# Why would that be the wrong thing to do in the above 
# example?

## This would be wrong because this would change the "Light"
## vector to only contain values < 50

#9.1.5.0.2 Exercise
# runif(n) is a function that generates a vector of n
# random, uniformly distributed numbers between 0 and 1. 
# Create a vector of 20 numbers, then find the subset of 
# those numbers that is less than the mean. More on runif and related functions soon.

x <- runif(20)
y <- mean(x)
z <- x[x<y] # Extracts the values that are less than the mean
z

#9.1.5.0.3 Exercise
# Find the positions of the elements that are less than 
# the mean of the vector you just created (e.g. if your 
# vector were (0.1 0.9 0.7 0.3) the answer would be (1 4))

a <- which(x<y)
a

# 9.1.5.0.4 Exercise
# Specify two ways to take only the elements in the odd 
# positions (first, third, …) of a vector of arbitrary 
# length.
unsure


######### 9.2 Matrices and Arrays

# 9.2.1.0.1 Exercise
# Use a command of the form X <- matrix(v,nrow=2,ncol=4) 
# where v is a data vector, to create the following matrix X:

v <- c(1,2,1,2,1,2,1,2)
x <- matrix(v, nrow=2, ncol=4)
x

# 9.2.1.0.2 Exercise
# Use rnorm and matrix to create a 5×7 matrix of Gaussian 
# random numbers with mean 1 and standard deviation 2.

n <- 5
m <- 7
x <- matrix(rnorm(n*m,mean=1, sd=2), nrow=5, ncol=7)
x

###### Functions for Matrices
###### R code	purpose
# matrix(v,nrow=m,ncol=n)	m×nm×n matrix using the values in v
# t(A)	transpose (exchange rows and columns) of matrix A
# dim(X)	dimensions of matrix X. dim(X)[1]=# rows,  dim(X)[2]=# columns
# data.entry(A)	call up a spreadsheet-like interface to edit the values in A
# diag(v,n)	diagonal n×nn×n matrix with vv on diagonal, 0 elsewhere (v is 1 by default, so diag(n) gives an n×nn×n identity matrix)
# cbind(a,b,c,...)	combine compatible objects by attaching them along columns
# rbind(a,b,c,...)	combine compatible objects by attaching them along rows
# as.matrix(x)	convert an object of some other type to a matrix, if possible
# outer(v,w)	“outer product” of vectors v, w: the matrix whose (i,j)(i,j)-th element is v[i]*w[j]
# Many of these functions have additional optional arguments; use the help system for full details.

## 9.2.2 cbind and rbind

C <- cbind(1:3, 4:6, 5:7)
C

D <- rbind(1:3,4:6)
D

### 9.2.2.0.1 Exercise
# Verify that rbind(C,D) works, cbind(C,C) works, but cbind(C,D) doesn’t.
# Why not?

x <- rbind(C,D)
x

y <- cbind(C,C)
y

z <- cbind(C,D)
## This doesn't work because cbind adds columns and must 
## have the same number of rows

######### 9.2.3 Matrix indexing

z <- A[2,3] # extracts from the 2nd row, 3rd column

######### 9.3 Arrays

### 9.3.0.0.1 Exercise
### What happens when we set the dimension attribute on a vector?
### For example:
 
x <- seq(1,27)
dim(x) <- c(3,9)
is.array(x)
is.matrix(x)


########## 9.6 Data Frames

setwd("~/Desktop")

data.hurricane <- read.csv("hurricanes.csv")
print(data.hurricane)
str(data.hurricane)

########## 11 Scripts and Data Files

course.url <- "http://kingaa.github.io/R_Tutorial/"
download.file(paste0(course.url, "Intro1.R"), destfile="Intro1.R", mode="w")

light <- c(20,20,20,20,21,24,44,60,90,94,101)
rmax <- c(1.73,1.65,2.02,1.89,2.61,1.36,2.37,2.08,2.69,2.32,3.67)

plot(light, rmax)
fit <- lm(rmax~light)
summary(fit)
abline(fit)


download.file(paste0(course.url, "Intro2.R"), destfile="Intro2.R", mode="w")
download.file(paste0(course.url, "ChlorellaGrowth.csv"), destfile="ChlorellaGrowth.csv", mode="w")

x <- read.csv("ChlorellaGrowth.csv", comment.char='#')
Light <- x[,1]
rmax <- x[,2]


## 11.0.0.0.1 Exercise
## Make a copy of Intro2.R under a new name, and modify the copy so that
## it does linear regression of algal growth rate on the natural log of 
## light intensity,  LogLight=log(Light), and plots the data appropriately.
## You should end up with a graph that resembles the following.

par(cex=1.5,cex.main=0.9)
plot(rmax~light,data=x,xlab="light intensity (uE/m2/s)",ylab="maximum growth rate (1/d)",pch=16) 

title(main="Data from Fussmann et al. (2000) system")
fit <- lm(rmax~Light)
summary(fit); abline(fit) 

# Next we get the regression equation to 'display itself' on the graph
c1 <- round(fit$coef[1],digits=3) 	# intercept	
c2 <- round(fit$coef[2],digits=3) 	# slope
text(50,3,paste("rmax=",c1,"+",c2,"light")) 

## 11.0.0.0.2 Exercise
## Run Intro2.R, then enter the command plot(fit) in the console and follow
## the directions in the console. Figure out what just happened by entering 
## ?plot.lm to bring up the help page for the function plot.lm() that carries
## out a plot() command for an object produced by lm(). 
## (This is one example of how R uses the fact that statistical analyses are stored 
## as model objects. fit “knows” what kind of object it is (in this case an object 
## of type lm), and so plot(fit) invokes a function that produces plots suitable 
## for an lm object.) 

## Answer: R produced a series of diagnostic plots exploring 
## whether or not the fitted linear model is a suitable fit to the data. 
## In each of the plots, the 3 most extreme points (the most likely candidates for 
## “outliers”) have been identified according to their sequence in the data set.



## 11.0.0.0.3 Exercise
## Create a plot of growth rate versus light intensity with the xx-axis running 
## from 0 to 120, and the yy-axis running from 1 to 4.

plot(rmax~light, xlim=c(0,120), ylim=c(1,4))


## 11.0.0.0.4 Exercise
## Several graphs can be placed within a single figure by using the par function 
## (short for “parameter”) to adjust the layout of the plot. For example the command 
## par(mfrow=c(m,n)) divides the plotting area into mm rows and nn columns. 
## As a series of graphs is drawn, they are placed along the top row from left to right,
## then along the next row, and so on. mfcol=c(m,n) has the same effect except that successive 
## graphs are drawn down the first column, then down the second column, and so on.

## Save Intro2.R with a new name and modify the program as follows. Use mfcol=c(2,1) 
## to create graphs of growth rate as a function of  Light, and of log(growth rate) as 
## a function of log(Light) in the same figure.
## Do the same again, using mfcol=c(1,2).

quartz(height=6, width=3)
par(mfcol=c(2,1))
plot(rmax~light)
plot(log(rmax)~log(light))

quartz(height=3, width=6)
par(mfcol=c(1,2))
plot(rmax~light)
plot(log(rmax)~log(light))


## 11.0.0.0.5 Exercise
## Use ?par to read about other plot control parameters that can be set using par(). 
## Then draw a 2×2set of plots, each showing the line y=5x+3 with x running 
## from 3 to 8, but with 4 different line styles and 4 different line colors.

quartz(height=6, width=6)
par(mfrow=c(2,2))

x <- 3:8
y <- 5*x+3

plot(y)
lines(y, col="blue", lty=1, lwd=3)

plot(y)
lines(y, col="forestgreen", lty=3, lwd=3)

plot(y)
lines(y, col="red", lty=5, lwd=3)

plot(y)
lines(y, col="black", lty=8, lwd=3)

### Xlim=c(3,8)

quartz(height=6, width=6)
par(mfrow=c(2,2))

x <- 3:8
y <- 5*x+3

plot(y, xlim=c(3,8))
lines(y, col="blue", lty=1, lwd=3)

plot(y, xlim=c(3,8))
lines(y, col="forestgreen", lty=3, lwd=3)

plot(y, xlim=c(3,8))
lines(y, col="red", lty=5, lwd=3)

plot(y, xlim=c(3,8))
lines(y, col="black", lty=8, lwd=3)


########## 12 Looping in R

## 12.1 for loops

phi <- 1
for (k in 1:100) {
  phi <- 1+1/phi
  print(c(k,phi))
}


## Beverton-Holt map (population growth model)

a <- 1.1
b <- 0.001
T <- seq(from=1, to=200, by=1)
N <- numeric(length(T))
n <- 2
for (t in T) {
  n <- a*n/(1+b*n)
  N[t] <- n
}
plot(T,N)

## An alternative way:

N <- numeric(length(T))
for (t in 1:length(T)) {
  n <- a*n/(1+b*n)
  N[t] <- n
}
plot(T,N)

###12.1.0.0.2 Exercise
## Check that this works with different vectors T. What happens when 
## T has length 1? What happens when T has length 0? Why? To avoid this 
## trap, it’s preferable to use seq_len, seq_along, or  seq.int instead 
## of the 1:n construction used above. This and many other R gotchas are 
## described in the useful R Inferno (Burns 2012).

## 12.2 while loops

phi <- 20
k <- 1
while (k <= 100) {
  phi <- 1+1/phi
  print(c(k,phi))
  k <- k+1
}

##### To terminate the iterations as soon as the value phi stops changing:
phi <- 20
conv <- FALSE
while (!conv) {
  phi.new <- 1+1/phi
  conv <- phi==phi.new
  phi <- phi.new
  print(c(k,phi))
}

## 12.2.0.0.1 Exercise
# Verify that the above works as intended. How many iterations are needed?

phi <- 20 
while (TRUE) {
  phi.new <- 1+1/phi
  if (phi==phi.new) break
  phi <- phi.new
}

phi <- 3
for (k in seq_len(1000)) {
  phi.new <- 1+1/phi
  if (phi==phi.new) break
  phi <- phi.new
}

## 12.2.0.0.2 Exercise
# Recompute the trajectory of the Beverton-Holt model using a while loop.
# Verify that your answer is exactly equivalent to the one above.

a <- 1.1
b <- 0.001
T <- seq(from=1, to=200, by=1)
N <- numeric(length(T))
n <- 2
while (t <= T) {
  n <- a*n/(1+b*n)
  N[t] <- n
}
plot(T,N)


## 12.3 repeat loops

phi <- 12
repeat {
  phi.new <- 1/(1+phi)
  if (phi==phi.new) break
  phi <- phi.new
  print(phi)
}