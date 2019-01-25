nVals <- seq(100, 500, by=100)
distTypes <- c("gaussian", "t5", "t1")

#Create a matrix with required label
simulation <- matrix(NA, nrow= 10, ncol = 5)
colnames(simulation) <- c("n", "Method", "Gaussian", "t5", "t1")
rownames(simulation) <- c("1", "2", "3", "4", "5", "6",
                          "7", "8", "9", "10")

#set counter for matrix
i = 1

#
for (n in nVals) {
  simulation[i, 1] <- n
  simulation[i + 1, 1] <- n
  simulation[i, 2] <- "PrimeAvg"
  simulation[i + 1, 2] <- "SampAvg"
  j = 3
  for (m in distTypes){
    #Generate path for each file with different name
    file <- paste("n", n, "dist_", m, ".txt",sep="")
    path <- paste("/home/haowenxu930622/biostat-m280-2019-winter/hw1/", file, sep="")
    
    #Read in data
    x <- read.table(path)
    
    #Input data from file
    simulation[i, j] <- as.character(x[2])
    simulation[i + 1, j] <- as.character(x[3])
    j = j + 1
  }
  i <- i + 2
}

simulation
