library(Rcpp)

nums <- vector()
#set up an counting variable
i <- 1
# parsing command arguments and store input into a vector
for (arg in commandArgs(TRUE)) {
  parse(text=arg)
  nums[i] <- eval(parse(text=arg))
  i <- i + 1
}

#Below is my rcpp function
fizzbuzz <- '
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::plugins("cpp11")]]
// [[Rcpp::export]]


double rcpp_fizzbuzz(IntegerVector v){
  for(int i=0; i<v.length(); ++i){
    if((v[i] % 3 == 0) & (v[i] % 5 == 0))
      Rprintf("Fizzbuzz\t");
    else if(v[i] % 3 == 0) 
      Rprintf("Fizz\t");
    else if(v[i] % 5 == 0) 
      Rprintf("Buzz\t");
    else
      Rprintf("1\t");
  }
return 0;
}
'

#Call the function
sourceCpp(code = fizzbuzz)
rcpp_fizzbuzz(nums)

