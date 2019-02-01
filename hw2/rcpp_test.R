library(Rcpp)

test <- "
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::plugins('cpp11')]]
// [[Rcpp::export]]
NumericVector rcpp_lambda_1(){
  NumericVector v = {1,2,3,4,5};
  double A = 2.0;
  NumericVector res =
    sapply(v, [&](double x){return A*x;});
  return res;
}"

sourceCpp(code = test)
x <- rcpp_lambda_1()
class(x)
typeof(x)
