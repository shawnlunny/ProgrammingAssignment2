##Lets test if the caching function is actually caching

##Learned to time functions from this stackoverflow post
##http://stackoverflow.com/questions/6262203/measuring-function-execution-time-in-r

#make sure we load our functions file
source("cachematrix.R")

message("Setting seed to 800 so we can fix our output to be the same for comparison")
set.seed(800)
#make matrix 1000 x 1000  with 100 million observations on a distribution from 1 to 1000
testmatrix <- matrix(runif(10000^2, 1, 1000), 1000, 1000)

#make the cache matrix object
testcachematrix <- makeCacheMatrix(testmatrix)

message("Get the time of our inversed matrix object")
print(system.time(cachematrix1 <- cacheSolve(testcachematrix)))

message("Get the time of our inversed matrix object (cached)")
print(system.time(cachematrix2 <- cacheSolve(testcachematrix)))

message("Is our 1st and 2nd matrix the same?")
print(identical(cachematrix1, cachematrix2))

message("Setting seed to 900 so we can fix our output to be the same for comparison")
set.seed(900)
#make matrix 1000 x 1000  with 100 million observations on a distribution from 1 to 1000
testmatrix <- matrix(runif(10000^2, 1, 1000), 1000, 1000)

message("Setting the new matrix object to override the cached version")
testcachematrix$set(testmatrix)
message("Get the time of our inversed cached matrix object")
print(system.time(cachematrix3 <- cacheSolve(testcachematrix)))

message("Did our new seed give us different matricies? We should see false...")
print(identical(cachematrix1, cachematrix3))

message("Get the time of our inversed matrix object (cached)")
print(system.time(cachematrix4 <- cacheSolve(testcachematrix)))

message("Is our 3rd and 4th matrix the same?")
print(identical(cachematrix3, cachematrix4))