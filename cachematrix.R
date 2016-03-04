## The point of the functions is to reduce the processing burden while inverting a matrix
## especially if the same inversion has already occurred previously
## The cache matrix funtion declares the matrix object and the cache solve matrix sets the data in the matrix


## Make an object function that has setters and getters for the data

makeCacheMatrix <- function(x = matrix()) {
  
  inverse <<- NULL
  
  set <- function(y){
    x <<- y
    inverse <<- NULL
  }
  
  get <- function(){
    x
  }
  
  setinverse <- function(solve){
    inverse <<- solve
  }
  
  getinverse <- function(){
    inverse
  }
  
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Return a matrix that is the inverse of 'x' if the matrix is a square
## Note: If the user does not use a square matrix the system will throw an error on solve
## if there is not a second matrix provided, thus we include the '...' if it is needed

cacheSolve <- function(x, ...) {
  
  inverse <- x$getinverse()
  
  if(!is.null(inverse)){
    message("Getting cached matrix")
    return(inverse)
  }
  
  data <- x$get()
  
  inverse <- solve(data, ...)
  
  x$setinverse(inverse)
  
  inverse
}
