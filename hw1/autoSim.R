# autoSim.R

nVals <- seq(100, 500, by=100)
distTypes <- c("gaussian", "t1", "t5")
rep <- 50
seed <- 280
for (n in nVals) {
  for (m in distTypes){
  oFile <- paste("n", n, "dist_", m, ".txt", sep="")
  sysCall <- paste("nohup Rscript runSim.R n=", n, " dist=", shQuote(shQuote(m)),
                   " rep=", rep, " seed=", seed, " > ", oFile, sep="")
  system(sysCall)
  print(paste("sysCall=", sysCall, sep=""))
  }
}




