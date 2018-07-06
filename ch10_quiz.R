load("~/Courses/statLearning/10.R.RData")
xBind = rbind(x,x.test);
pca.out=prcomp(xBind, scale=TRUE, rank=5)
summary(pca.out)