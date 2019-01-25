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


#calculate MSE, true mean is 0 for standard normal and t distribution
mse <- function(sample_size = 100, seed = 280, repetition = 50,
                dist = "gaussian"){
  #set seed
  set.seed(seed)  
  
  #creat empty vector to store mean value for each simulation
  prime_mean <- 0
  classic_mean <- 0
  prime_mse <- 0
  classic_mse <- 0
  #simulating rep times and store it's mean
  for(i in 1 : repetition){
    #simulation data
    x = 0
    if (dist == "gaussian") {
      x <- rnorm(sample_size)
    }else if (dist == "t5") { 
      x <- rt(sample_size, df = 5)
    }else if (dist == "t1") {
      x <- rcauchy(sample_size)
    }
    prime_mean <- prime_mean + estMeanPrimes(x) ^ 2
    classic_mean <- classic_mean + mean(x) ^ 2
  }
  prime_mse = prime_mean / repetition
  classic_mse = classic_mean / repetition
  return(c(prime_mse, classic_mse))
}
#call mse function with simulated means created previously
mse(n, seed, rep, dist)

