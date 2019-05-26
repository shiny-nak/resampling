#Use Library
library(MASS)
#Sample Variance
variance <- function(x){var(x)*(length(x)-1)/length(x)}
#Sample Standard Deviation
sd2 <- function(x){sqrt(variance(x))}

#Sample_data
Oridata<-read.csv("data.csv",stringsAsFactors = F)
Oridata<-na.omit(Oridata)

#summary(Oridata)

#Resampling based on Correlation Matrix
mu <- apply(Oridata,2,mean)
sig <- cor(Oridata)
ReSamplingData <- MASS::mvrnorm(1000, mu, sig)

#Discretization (Rounding)
ReSamplingData<-round(ReSamplingData)

#Compensate upper and lower limits
ReSamplingData[ReSamplingData>7]=7
ReSamplingData[ReSamplingData<1]=1



