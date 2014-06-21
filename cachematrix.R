## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix creates an object to be used in the function Cachesolve
## also provides a list of commands set, get, setsolve and getsolve to be used
## in the Cache solve function

#Example: makeCacheMatrix(matrix(1:4,2))

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## provides the inverse of the matrix
##it used some of the function listed in the 
##funtion makeCacheMatrix, as getsolve, get...

## Example cacheSolve(makeCacheMatrix(matrix(1:4,2)))

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}
