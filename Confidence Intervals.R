### Statistics for genomics

## Measures of central tendency
x=runif(10)
mean(x) ## Means can be affected by outliers
median(x) ## Medians are more robust and are not affected by outliers

## Measures of variability
x=rnorm(20,mean=6,sd=0.7)

##Variance
var(x) # variance could be affected by outliers
## A way to measure variance that could be less affected by outliers 
## is looking at where the bulk of the distribution is.
## One common way is to look at the difference between 75th percentile and 25th percentile, 
## this effectively removes a lot of potential outliers which will be towards the edges of the range of values.

##Standard deviation
sd(x)

## Interquartile range
IQR(x)
quantile(x)
quantile(x, probs=c(0.25,0.75))
IQR(x) == (quantile(x, probs=0.75) - quantile(x, probs=0.25))
boxplot(x, horizontal=TRUE)

dnorm(-2, mean=0, sd=2)
pnorm(-2, mean=0, sd=2)
pnorm(-2, mean=0, sd=2,lower.tail = FALSE)
rnorm(5, mean=0 , sd=2)
qnorm( 0.15, mean=0 , sd=2)


## Precision of estimates: Confidence intervals
# When we take a random sample from a population and compute a statistic, such as the mean, 
# we are trying to approximate the mean of the population. How well this sample statistic 
# estimates the population value will always be a concern. A confidence interval addresses 
# this concern because it provides a range of values which will plausibly contain the 
# population parameter of interest. 

library(mosaic)
set.seed(21)
sample1= rnorm(50,20,5) # simulate a sample

# do bootstrap resampling, sampling with replacement
boot.means=do(1000) * mean(resample(sample1))

# get percentiles from the bootstrap means
q=quantile(boot.means[,1],p=c(0.025,0.975))

# plot the histogram
hist(boot.means[,1],col="cornflowerblue",border="white",
     xlab="sample means")
abline(v=c(q[1], q[2] ),col="red")
text(x=q[1],y=200,round(q[1],3),adj=c(1,0))
text(x=q[2],y=200,round(q[2],3),adj=c(0,0))

# compare to normal approximation
alpha=0.05
sd=5
n=50
mean(sample1)+qnorm(c(alpha/2,1-alpha/2))*sd/sqrt(n)
