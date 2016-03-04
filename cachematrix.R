## The point of the functions is to reduce the processing burden while inverting a matrix
## especially if the same inversion has already occurred previously
## The cache matrix funtion declares the matrix object and the cache solve matrix sets the data in the matrix


## Make an object function that has setters and getters for the data

makeCacheMatrix <- function(x = matrix()) {
  
  inverse <<- NULL
  
  #sets the matrix
  set <- function(y){
    x <<- y
    inverse <<- NULL
  }
  
  #gets the matrix
  get <- function(){
    x
  }
  
  #inverses the matrix
  setinverse <- function(solve){
    inverse <<- solve
  }
  
  #retrieves the inverse of the matrix
  getinverse <- function(){
    inverse
  }
  
  #list the functions of the makeCacheMatrix funtion
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Return a matrix that is the inverse of 'x' if the matrix is a square
## Note: If the user does not use a square matrix the system will throw an error 
## on solve if there is not a second matrix provided, thus we include the '...' 
## as a parameter forward to solve incase it is needed

cacheSolve <- function(x, ...) {
  #this will be null the first time the function is run
  #but will have the inversed matrix on subsequent runs
  inverse <- x$getinverse()
  
  #if we already inversed this matrix the return it
  if(!is.null(inverse)){
    message("Getting cached matrix")
    return(inverse)
  }
  
  #otherwise get the matrix
  data <- x$get()
  
  #inverse the data
  inverse <- solve(data, ...)
  
  #set the cache with the inversed data
  x$setinverse(inverse)
  
  #return the inversed matrix
  inverse
}
