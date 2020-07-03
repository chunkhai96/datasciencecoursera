setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
source("cachingInverse.R")

sampleData = matrix(1:4, nrow = 2, ncol = 2)

cacheMatrix = makeCacheMatrix(sampleData)

cacheSolve(cacheMatrix)  # First computation
cacheSolve(cacheMatrix)  # Second computation (using cache)