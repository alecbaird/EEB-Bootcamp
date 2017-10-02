#### R Bootcamp 
#### Exercise 2: Plotting and genetic variation data analysis exercises
## By Alec S Baird

setwd("~/Desktop/UCLA - Courses/EEB 201 R Bootcamp")

#### Plotting and genetic variation data analysis exercises, Assignment 2

snpsDataFrame=read.table('hapmap_CEU_r23a_chr2_ld.txt',header=TRUE)
snps=as.matrix(snpsDataFrame)


## Researchers will often summarize P-values in genome-wide studies by
## making a QQ-plot. The QQ-plot has the observed (the ones you actually
## computed) P-values on the y-axis vs. the expected P-values on the x-axis.
## For a properly calibrated test, under the null hypothesis (i.e. meaning all
## the SNPs are in Hardy-Weinberg equilibrium) the observed P-values will
## follow a uniform distribution. This means that 1% of P-values will be <0.01,
## 5% of P-values will be <0.05, 25% of P-values will be <0.25, etc. A QQ
## plot is a nice way to visualize whether the P-values indeed follow a
## uniform distribution.

## a. To start let’s revisit our tests of Hardy-Weinberg. Go back and
## perform the chi-square test for Hardy-Weinberg that we did in class
## on all SNPs in the “hapmap_CEU_r23a_chr2_ld.txt” file. Hint: you
## already have the code for this… Save your P-values in a vector
## called “pvals”.



compute_chisquare_2=function(x){
  freq=sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x)))
  cnt0=sum(x==0,na.rm=TRUE)
  cnt1=sum(x==1,na.rm=TRUE)
  cnt2=sum(x==2,na.rm=TRUE)
  obscnts=c(cnt0,cnt1,cnt2)
  #print(obscnts)
  n=sum(obscnts)
  #here we use the built-in function for the chi-sq distribution:
  exp_probs=c((1-freq)^2,2*freq*(1-freq),freq^2) #note, here we don't multiply by n
  chisq<-chisq.test(obscnts,p=exp_probs, correct = FALSE)$statistic
  return(chisq)
}

chisqs2=apply(snps,1,compute_chisquare_2)
chisqs2

pvals=pchisq(chisqs2,1,lower.tail=FALSE)


## b. What proportion of P-values from the test (put in the vector called
## “pvals”) are <0.05? What proportion are <0.01? Are any <0.001?

## < 0.05
signifthres<-0.05
sum(pvals<signifthres) 
mean(pvals<signifthres) 

181 / 4014 -> 0.045 # 0.05 if rounding

## < 0.01
signifthres2 <- 0.01
sum(pvals<signifthres2)
mean(pvals<signifthres2)

41 / 4014 -> 0.010 

## < 0.001
signifthres3 <- 0.001
sum(pvals<signifthres3)
mean(pvals<signifthres3)

5 / 4014 -> 0.0012

## c. How many SNPs were tested for departures from Hardy-Weinberg
## equilibrium? Hint: How many P-values do you have? Second hint:
## Try using the “length” function. Save this value in the variable called
## “num_pval”.

num_pvals <- length(pvals)
num_pvals

## d. Say that you have “num_pval” total P-values. Assuming that the
## null hypothesis is true (i.e. all SNPs are in Hardy-Weinberg), the
## smallest P-values is expected to be 1/num_pval. The second
## smallest P-value is expected to be 2/num_pval. The third smallest
## P-value is expected to be 3/num_pval, etc. The largest P-value is
## expected to be num_pval/num_pval (or 1). Calculate the vector of
## expected P-values for the chi-square test. Save these in the vector
## called “exp_pvals”.
1/num_pval
2/num_pval
3/num_pval
num_pval/num_pval

exp_pvals <- vector("numeric", 4014)
for(i in 1:num_pvals) {
  exp_pvals[i] <- (i)/num_pvals
  }
print(exp_pvals)

## e. The observed P-values in the “pvals” vector are in the order that
## they SNPs appear across the chromosome. We need to sort them,
## smallest to largest. Use the “sort” function to sort the P-values.
## Store them in the vector “sort_pvals”.

sort_pvals <- sort(pvals, decreasing=FALSE)
sort_pvals

## f. In order to see what is happening with the small P-values (these
## are the ones we really care about), people often take the –log10(Pvalue).
## Find the –log10 of the observed and expected P-values.
## Store these in the vector “log_sort_pvals” and “log_exp_pvals”.

log_sort_pvals <- -log10(sort_pvals)
log_exp_pvals <- -log10(exp_pvals)

## g. You’re ready to make the QQ plot! Plot the “log_sort_pvals” vs. the
## “log_exp_pvals”.
quartz(height=3.5, width=3.5)
par(mar=c(4,4,1,1))
plot(log_exp_pvals, log_sort_pvals, xlab=NA, ylab=NA, ylim=c(0,4), xlim=c(0,4))
mtext(expression(Log[10](Expected~P-Values)), line=2.5, side=1)
mtext(expression(Log[10](Observed~P-Values)), line=2.5, side=2)

## h. Where should these P-values fall under the null hypothesis? They
## should fall along the diagonal. Add a diagonal line to the QQ plot.

snpsmodel <- lm(log_sort_pvals~log_exp_pvals)
summary(snpsmodel)
abline(snpsmodel, lwd=2, col="forestgreen")


## 2. Researchers are very interested in testing whether certain alleles are
## present in higher frequency in individuals with traits, such as type 2
## diabetes. We have blood glucose levels for the 60 individuals in this study.

## a. Load the file “pheno.sim.2014.txt”. Store the phenotypes in a data
## frame called “zz”. The second column in this file contains the blood
## glucose measurements. Hint: you probably want to use “header=T”
## in the “read.table” command.

phenosimDataFrame=read.table('pheno.sim.2014-2.txt',header=TRUE)
pheno=as.matrix(phenosimDataFrame)

## b. Find the value of the phenotype such that 25% of the individuals
## have a phenotype LESS than this value.

meanglucose <- mean(pheno)

less25 <- quantile(pheno, 0.25)
less25

## c. Find the value of the phenotype such that 25% of the individuals
## have a phenotype GREATER than this value (i.e. 75% of the
## individuals have a phenotype LESS than this value).

more25 <- quantile(pheno, 0.75)
more25
pheno
## d. Make a density plot of the distribution of phenotypes (i.e. the blood
## glucose levels). Add vertical lines to the plot to denote the 25% and
## 75% tails of the distribution.

quartz(height=3.5, width=3.5)
par(mar=c(4,4,1,1))
plot(density(pheno), xlab="Phenotype", ylab="Count")

abline(v=less25, col="red", lty=5)
abline(v=more25, col="blue", lty=5)

legend(x=40, y=.04, legend=c("25% Tail", "75% Tail"), lty=c(5,5), col=c("red", "blue"), cex=.75)
