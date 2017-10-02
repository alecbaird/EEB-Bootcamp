#### Modeling Homework Exercise #1
## by Alec S Baird

setwd("~/Desktop/UCLA - Courses/EEB 201 R Bootcamp")

K <- 3000
r <- 1.05
N <- 0
tMax <- 10


rickerfun <- function(r=1.05, N=0, tMax=10, K=3000) {
  NN <- rep(NA, tMax+1)
  NN[1] <- N
for(t in 1:tMax) {
  NN[t+1] <- NN[t]*exp(r*(1-(NN[t])/(K)))
  }
plot((1:(tMax+1)), NN, type = "b", ylab="Population Size (N)", xlab="Time")
return(NN)
}

## Population decreases to 0
### Change the growth rate r negative
rickerfun(r=-1.05, N=100, tMax=50, K=2000)

## Population approaches stable equilibrium at n* = K, without oscillations
### Change carrying capacity K to the value of N
rickerfun(r=1.05, N=100, tMax=50, K=100)

## Decaying oscillations around n* = K
### Change r to 2
rickerfun(r=2, N=100, tMax=200, K=2000)

## Persistant regular oscillations
## Change the plot type to "b" to see the points and the lines between points
### Changing the r to 2.5 causes these oscillations
rickerfun(r=2.5, N=100, tMax=100, K=500)

## Crazy, random-looking fluctuations (chaos)
### Change the r to anything > than 2.5
rickerfun(r=4, N=100, tMax=100, K=500)

## Answer: The growth rate r is the key parameter driving the above observed patterns

quartz(height=8, width=6)
par(mfrow=c(2,3), mar=c(4,4,1,1))

rickerfun(r=-1.05, N=100, tMax=100, K=2000)
text(x=80, y=100, "r=-1.05", cex=1.25)
#mtext(side=2, "Population Size (N)", line=2.5)
#mtext(side=1, "Time", line=2.5)

rickerfun(r=1.05, N=100, tMax=100, K=2000)
text(x=80, y=1800, "r=1.05", cex=1.25)

rickerfun(r=2, N=100, tMax=100, K=2000)
text(x=80, y=2500, "r=2.0", cex=1.25)

rickerfun(r=2.5, N=100, tMax=100, K=2000)
text(x=80, y=300, "r=2.5", cex=1.25)

rickerfun(r=4, N=100, tMax=100, K=2000)
text(x=80, y=10000, "r=4.0", cex=1.25)

rickerfun(r=6, N=100, tMax=100, K=2000)
text(x=90, y=50000, "r=6.0", cex=1.25)

#### Question D
## What is t(K/2), the first year n(t) >= K/2


rickerfun2 <- function(r=1.05, N=20, tMax=10, K=1000, figure=TRUE) {
  NN <- rep(NA, tMax+1)
  NN[1] <- N
  for(t in 1:tMax) {
    NN[t+1] <- NN[t]*exp(r*(1-(NN[t])/(K)))
  }
  if(figure==TRUE){
    plot((1:(tMax+1)), NN, type = "b", ylab=expression("Population Size (N)"), xlab="Time")
  }
    return(NN)
}



nVec <- rickerfun2(r=1.05, N=20, tMax=10, K=1000)
which(nVec >= 500)[1]
nVec

#### Question E

r <- seq(.1:.9, by=.1)

NN <- matrix(NA, nrow=1, ncol=length(r))

for(i in 1:length(r)) {
nVec2 <- rickerfun2(r[i], N=20, tMax=100, K=1000, figure=FALSE)
NN[i] <- which(nVec2 >= 500)[1]
}


plot(r, NN)
r
NN
lines(r,NN)

##### F & G

## Define parameter values; use a vector to hold a range of values for the
## parameter(s) you wish to vary.

rr <- seq(.25:1, by=.25)
kk <- seq(1,100,by=1)

kk
rr

NNN <- matrix(NA, nrow=length(kk), ncol=length(rr))

for(i in 1:length(rr)) {
  for(ii in 1:length(kk)){
    extraction <- rickerfun2(rr[i], N=20, tMax=100, kk[ii], figure=FALSE)
    NNN[i,ii] <- extraction[100]
  }
}

print(NNN)


