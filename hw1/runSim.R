## parsing command arguments
for (arg in commandArgs(TRUE)) {
  eval(parse(text=arg))
}

## check if a given integer is prime
isPrime = function(n) {
  if (n <= 3) {
    return (TRUE)
  }
  if (any((n %% 2:floor(sqrt(n))) == 0)) {
    return (FALSE)
  }
  return (TRUE)
}

## estimate mean only using observation with prime indices
estMeanPrimes = function (x) {
  n = length(x)
  ind = sapply(1:n, isPrime)
  return (mean(x[ind]))
}

#set seed
set.seed(seed)
#simulation function
sim = function (n, dist){
  if (dist == "gaussian") {
    x = rnorm(n)
  }else if (dist == "t1"){ 
    x = rt(n, df = 1)
  }else if (dist == "t5"){
    x = rt(n, df = 5)
  }
  return (x)
}
#creat empty vector to store mean value for each simulation
prime_mean <- vector(length = rep)
classic_mean <- vector(length = rep)
#simulating rep times and store it's mean
for(i in 1 : rep){
  prime_mean[i] <- estMeanPrimes(sim(n, dist))
  classic_mean[i] <- mean(sim(n, dist))
}
#calculate MSE, true mean is 0 for standard normal and t distribution
mse = function (x, y, repetition){
  prime_mse = sum(x ^ 2) / repetition
  classic_mse = sum(y ^ 2) / repetition
  return(paste(prime_mse, classic_mse))
}
#call mse function with simulated means created previously
mse(prime_mean, classic_mean, rep)