#set up an empty vector to take values from input
nums <- vector()
#set up an counting variable
i <- 1
# parsing command arguments and store input into a vector
for (arg in commandArgs(TRUE)) {
  parse(text=arg)
  nums[i] <- eval(parse(text=arg))
  i <- i + 1
}
  
#fizzbuzz function
fizzbuzz <- function(nums=c(1:10)){
  for (j in nums){
    if (j %% 3 == 0 & j %% 5 == 0){
      print("FizzBuzz")
    }else if (j %% 3 == 0){
      print("Fizz")
    }else if (j %% 5 == 0){
      print("Buzz")
    }else{
      print(j)
    }
  }
}
#call function with the vector created from input
fizzbuzz(nums)
