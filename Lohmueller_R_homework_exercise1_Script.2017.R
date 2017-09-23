#### R Bootcamp 
#### Exercise 2: Plotting Exercise
## By Alec S Baird

setwd("~/Desktop/UCLA - Courses/EEB 201 R Bootcamp")

#### Plotting and genetic variation data analysis exercises, Assignment 1
y <- 100
z <- 1000

get_heights <- function(x){   
  ## This creates a vector of random heights for x (population size)
  heights <- rnorm(x,mean=69,sd=10)
  averageheight <- mean(heights)
  return(averageheight) 
}

get_heights(y)
get_heights(z)


#### Part 4
mean_heights_100 <- numeric()

for(i in 1:1000){
  mean_heights_100 <- c(mean_heights_100, get_heights(y))
}
  length(mean_heights_100)

mean_heights_100

#### Part 5
mean_heights_1000 <- numeric()

for(i in 1:1000){
  mean_heights_1000 <- c(mean_heights_1000, get_heights(z))
}
  length(mean_heights_1000)

#### Part 6
  
bins <- seq(65, 73, by=.5)
  
counts_100 <- hist(mean_heights_100, breaks=bins, plot=F)$counts
counts_1000 <- hist(mean_heights_1000, breaks=bins, plot=F)$counts

quartz(height=4, width=5)
par(mfrow=c(1,1), mar=c(4,4,1,1))
barplot(rbind(counts_100, counts_1000), col=c("red", "blue"), beside=T, names.arg=seq(65, 72.5, by=.5),
        xlab = "Average height (inches)", ylab="Count", ylim=c(0,500))
legend(0,500,c("n=100","n=1000"),col=c("red","blue"),pch = 15)

