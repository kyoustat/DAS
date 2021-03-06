% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stat_test2.2018bbw.R
\name{test2.2018bbw}
\alias{test2.2018bbw}
\title{Test for Equality of Two Distributions by Blumberg, Bhaumik, and Walker (2018)}
\usage{
test2.2018bbw(x, label)
}
\description{
Test for Equality of Two Distributions by Blumberg, Bhaumik, and Walker (2018)
}
\examples{
## small test for CRAN submission
dat1 <- matrix(rnorm(60, mean= 1), ncol=2) # group 1 : 30 obs of mean  1
dat2 <- matrix(rnorm(50, mean=-1), ncol=2) # group 2 : 25 obs of mean -1

dmat <- as.matrix(dist(rbind(dat1, dat2)))  # Euclidean distance matrix
lab  <- c(rep(1,30), rep(2,25))             # corresponding label

test2.2018bbw(dmat, lab)                    # run the code !

\dontrun{
## WARNING: computationally heavy. 
#  Let's compute empirical Type 1 error at alpha=0.05
niter = 496  
pvals = rep(0,niter)
for (i in 1:niter){
  dat = matrix(rnorm(300),ncol=3)
  lab = c(rep(1,60), rep(2,40))
  pvals[i] = test2.2018bbw(as.matrix(dist(dat)), lab)$p.value
  print(paste("iteration ",i," complete..",sep=""))
}
print(paste("* Empirical Type 1 Error : ",sum(pvals<=0.05)/niter,sep=""))

#  Visualize the above at multiple significance levels
alphas = seq(from=0.001, to=0.999, length.out=100)
errors = rep(0,100)
for (i in 1:100){
   errors[i] = sum(pvals<=alphas[i])/niter
}
plot(alphas, errors, "b", main="Empirical Type 1 Errors", 
     xlab="alpha", ylab="error", lwd=2)
abline(0,1, lwd=2, col="red")
}

}
\references{
\insertRef{blumberg_testing_2018}{DAS}
}
