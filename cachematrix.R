## Put comments here that give an overall description of what your
## functions do
## Two functions that can invert input matrices or 
##return them from cache if already calculated

## Write a short comment describing this function
## creates list of four different functions

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL                                 ##sets i so that it can be used for invert matrix
  
  set <- function(y) {                      ##replaces the input matrix and resets i; <<- is used in order to store in global environment, not in the set() function;
    x <<- y                                 ##use set() function to replace matrix with new or changed matrix
    i <<- NULL
  }
  get <- function() x                       ##gets the input data, no argument needed
  setsolve <- function(solve) i <<- solve   ##sets the invert matrix; note: does NOT calculate invert, simply stores the input
  getsolve <- function() i                  ##gets the matrix stored in setsolve (assumingly invert matrix)
  list(set = set, get = get,                ##stores the defined function into a list,s o that they can be called by different functions
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function
## inverts the input matrix, or if already inverted, 
##returns the inverted matrix from cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  ##defines m
  if(!is.null(m)) {                         ##checks, whether m has been calculated yet
    message("getting cached data")          ##if so, returns m from cache
    return(m)
  }
  data <- x$get()                           ##stores matrix in object
  m <- solve(data, ...)                     ##inverts stored matrix
  x$setsolve(m)                             ##sets m 
  m
}
