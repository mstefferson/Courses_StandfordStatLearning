library(e1071)
nRep = 50;
x = c( rnorm(10 * nRep,0), rnorm(5*nRep,1), rnorm(5*nRep,1))
y = c( rep(0,10*nRep), rep(1,10*nRep) )
sizeSet = length(x)
randInd = sample( sizeSet, sizeSet / 2)
dat=data.frame(x,y)
svmfit=svm(y~.,data=dat,subset = randInd)
pred = predict(svmfit,dat[-randInd,])
pred != dat[-ranInd]$y
sum(pred != dat[-ranInd]$y) / length(pred)

print(svmfit)
plot(svmfit,dat)
xPred = c( rnorm(10,0), rnorm(5,1), rnorm(5,1))
yPred = predict(svmfit)


generate_data = function(){
  top = matrix(rnorm(500), ncol = 10)
  bl = matrix(rnorm(250,mean = 1),ncol=5)
  br = matrix(rnorm(250),ncol=5)
  bottom = cbind(bl,br)
  full = rbind(top,bottom)
  full = as.data.frame(full)
  full$y = as.factor(rep(0:1, each=50))
  return(full)
}

out = generate_data()
svmfit=svm(y~.,data=out)
