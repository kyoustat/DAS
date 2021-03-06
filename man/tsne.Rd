% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ml_tsne.R
\name{tsne}
\alias{tsne}
\title{t-SNE embedding}
\usage{
tsne(x, ndim = 2, ...)
}
\description{
t-SNE embedding
}
\examples{
## use simple example of iris dataset 
data(iris) 
dat  = iris[,1:4]
dat.n = nrow(dat)
dat.p = ncol(dat)
dat  = dat + matrix(rnorm(dat.n*dat.p, sd=0.1), ncol=dat.p)
dmat = as.matrix(stats::dist(dat)) # distance matrix

## run t-SNE and MDS for comparison
iris.cmds = cmds(dmat, ndim=2)
iris.tsne = tsne(dmat, ndim=2)

## extract coordinates and class information
cx = iris.cmds$embed # embedded coordinates of CMDS
tx = iris.tsne$embed #                         t-SNE
icol = iris[,5]      # class information


## visualize
mc = paste("CMDS with STRESS=",round(iris.cmds$stress,4),sep="")
mt = paste("tSNE with STRESS=",round(iris.tsne$stress,4),sep="")

opar <- par(mfrow=c(1,2), pty="s")
plot(cx, col=icol,pch=19,main=mc)
plot(tx, col=icol,pch=19,main=mt)
par(opar)

}
