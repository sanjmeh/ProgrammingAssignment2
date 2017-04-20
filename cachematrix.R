## Put comments here that give an overall description of what your
## functions do

## Creates a special matrix that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  invrs<-NULL
  set <- function(y) {
    x<<-y
    invrs <<- NULL
  }
  get <- function() x
  setInvrs <- function(inverse) invrs <<- inverse
  getInvrs <- function() invrs
  list(set = set, get=get, setInvrs = setInvrs, getInvrs = getInvrs)
}


## Calculates the inverse of the matrix from the function machCacheMatrix 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  invrs<- x$getInvrs()
  if(!is.null(invrs)){
    message("getting cached data")
    return(invrs)
  }
  data <- x$get()
  invrs <- solve(data,...)
  x$setInvrs(invrs)
  invrs
}
