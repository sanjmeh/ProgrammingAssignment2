## Below two functions are used to create a  object it
## store a matrix and cache its inverse. 


## makeCacheMatrix creates a special 'matrix' object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## cacheSolve calculates the inverse of the special "matrix" returned 
## by makeCacheMatrix .if the inverse has already been calculated 
## the cacheSolve get the inverse from cache.

cacheSolve <- function(x, ...) {
## return a matrix that is the inverse of 'x'
  inv <- x$getinverse() 
## get the inverse data from the above function
##  check if its NULL or not, it isnt NULL then it returns the inverse value
  if(!is.null(inv)) {
    message("cached data")
    return(inv)
  }
  
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}