# load
load("~/Courses/statLearning/ch5_data.RData")
# run linear fit (5.R.R1)
fit1=lm(y~.,data=Xy)
coef( lm(y~.,data=Xy) )
summary(fit1)
# plot it (5.R.R2)
matplot(Xy,type="l") 
# boot (5.R.R3)
# create boot function, coeff guess, pg. 196
boot.fn=function( data, index){
  return( coef( lm(y~., data = data, subset = index) ) )
}
# run boot
boot.out = boot(Xy, boot.fn, 1000)
# 5.R.R4
# sample with blocks of 100 contiguous observation
# column of start indices
ns = c(1,101,201,301,401,501,601,701,801,901)
block = 1:10
for (i in 1:10) {
  # generate a 1000 sample for each length 100 block
  new.rows = sample( ns[i]:ns[i] + 100, 1000, replace=TRUE );
  new.Xy = Xy[ new.rows,  ]
  boot.out=boot(new.Xy, boot.fn, 1000)
  block[i] = boot.out$t0[2]
  print( i   )
}
# get standard deviation of the time series
sd(block)
