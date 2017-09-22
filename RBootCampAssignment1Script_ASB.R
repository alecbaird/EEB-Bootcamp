#### R Bootcamp 
#### Exercise 1: Control and Flow
## By Alec S Baird

setwd("~/Desktop/UCLA - Courses/EEB 201 R Bootcamp")

## Exercise 1) Write a for loop statements so that it runs from 1:9 
## and prints the following output to your screen:

for (k in 1:9) {
    cat("\n")  #### "\n" ends the line
  if (k==9){
    print("*")}}

## Exercise 2) Modify your for loop so that it prints 10 asterisks,
## with each asterisk separated by exactly one ampersand sign (&), 
## with no spaces or new line characters.

for (k in 1:9) {
    cat("*&")
  if (k==9){
    cat("*")
  }
}

## Exercise 3) by hand, figure out the initial values of these variables 
## and values at the the start and end of each iteration of the loop

dogs <- 10;
for (i in 1:5){
  dogs <- dogs+1
}
## if dogs = 10, then i in 1:5 translates to: 10, 11, 12, 13, 15
## and because our loop as +1, the intial value becomes 11, and the
## final value becomes 16

meatloaf <- 0;
for (i in 5:9){
  meatloaf <- meatloaf - i +1;
  cat(meatloaf)
  print(meatloaf)
}
## Value 1: 0 - 5 + 1 -> -4
## Value 2: -4 - 6 + 1 -> -9
## Value 3: -9 - 7 + 1 -> -15
## Value 4: -15 - 8 + 1 -> -22
## Value 5: -22 - 9 + 1 -> -30
#### This loop uses the answer from the previous iteration to 
#### calculate the next value

bubbles <- 12;
for (i in -1:-4) {
  bubbles <- i;
}

## Value 1: -1
## Value 2: -2
## Value 3: -3
## Value 4: -4


## Exercise 4) modify this code so that it will print out a message
## during presidential as well as congressional election years

### you can use the if statement with the modulus operator to 
### conditionally perform operations
years <- c( 2015, 2016, 2018, 2020, 2021)
for(ii in 1:length(years)){
  if(years[ii] %% 2 == 0){
    cat(years[ii], 'Hooray, congressional elections!', sep = '\t', fill = T)
  }
  if(years[ii] %% 4 == 0){
    cat(years[ii], 'Hooray, presidential elections!', sep = '\t', fill=T)
  }  }


## Exercise 5) More fun with loops. Here are the bank accounts from seven
## randomly selected UCLA grad students

bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5)

interestRate <- 0.0125;
compounded 
for( i in 1:length(bankAccounts)) {
  bankAccounts[i] <- interestRate*bankAccounts[i] + bankAccounts[i];
  print(bankAccounts)
  }
 
## Change "compounded[i] to bankAccounts[i]

## Exercise 6) Go back to the compounded interest example. 
## Suppose we now want to compound the interest annually,
## but across a period of 5 years. The for loop we discussed 
## earlier only compounds for a single year. Try this:

bankAccounts <- c(10, 9.2, 5.6); #baseline money
interestRate <- 0.0525
house <- c(4.8, 3.8, 5.7) #deduct
food <- c(7.8, 2.1, 10.5) #deduct
fun <- c(7.8, 2.1, 10.5) #deduct

income <- c(21,21,21) # add

for (j in 1:5) {
  for (i in 1:length(bankAccounts))
    bankAccounts[i] <- interestRate*bankAccounts[i] + bankAccounts[i]
                      - house - food - fun + income;
  print(bankAccounts)
}

## Exercise 7) Three students have estimated annual expenditures for 
## food, housing, and fun of: (in thousands of dollars)
## Modify the 5-year interest-compounding code from #5 and #6 so 
## that it runs from 2015-2020 and so that in odd numbered years 
## students 1 and 3 get trust fund disbursements of $5000. 
## (hint the modulus function %% will be helpful )

bankAccounts <- c(10, 9.2, 5.6); #define bank accounts here
interestRate <- 0.0525;   
house <- c(4.8, 3.8, 5.7); 
food<- c(3.5, 4.3, 5.0); 
fun <- c(7.8, 2.1, 10.5); 



income <- c(21, 21, 21);
students<-c(1,2,3)
years <- c( 2015, 2016, 2018, 2020)


for(ii in 1:length(years)){
  if((students==1||students==3) && !(years[ii]%%2 ==0)){
    bankAccounts<-bankAccounts+5000
  }
}
print(bankAccounts)

bankAccounts<-(bankAccounts-house-food-fun+income)
for (j in 1:5) {
  bankAccounts<-(bankAccounts-house-food-fun+income)
  print(bankAccounts)
  for (i in 1:length(bankAccounts)) {
    bankAccounts[i] <- interestRate*bankAccounts[i] + bankAccounts[i]; }
  print(bankAccounts)
}

##




## Exercise 8) use a while loop to sum all numbers from 1:17. 
## You will need to use a counter variable (like index seen in class)
i<-1
sumi<-0
while (i <= 17){
  sumi<-i+sumi
  i<-i+1
}
print(sumi)


## Exercise 9) write a function that takes a number, and prints ‘small’ 
## if number less than or equal to -1; ‘medium’ if between -1 and + 
## 1’big’ if greater than or equal to + 1

i<- 4
if (i <= (-1)){
  cat("Small")
} else if ((i > -1) && (i < 1)){
  cat("Medium")
} else{
  cat("Big")
}




#### Plotting and genetic variation data analysis exercises, Assignment 1
heights <- rnorm(100, mean=69, sd=10)

get_heights <- function(x){   
  heights<-rnorm(100,mean=69,sd=10)
  return(heights) &
    heightmean <- mean(heights)
    print(heightmean)
  }
}
  
heightmean

mean(x)
                       


heights

  
heights1 <- rnorm(100, mean=69, sd=10)
heights2 <- rnorm(1000, mean=69, sd=10)

heights.all <- c(heights1, heights2)

mean(heights.all)
