<<<<<<< HEAD
# This code returns the inverse of a large matrix with caching functionality.
# Caching is implemented without the makeCachematrix fucntion.
# So if the input matrix matches the last matrix, with previous inverted matrix stored in a cache is returned. 
#If the input doesnt match then a new solve() is invoked.

xmaster<-matrix() # a global variable storing the input matrix after it is solved.
xinverse<-matrix() # another global variable storing the inverse of xmaster.

# cacheSolve takes an input matrix and returns its inverse; 
# It takes two parameters x and y but the parameter y is not need not be passed as input.
# The paramter y is initialised from the global variable xmaster which stores a copy of the last matrix inverted. 
# If the passed matrix matches the stored global matrix, then the inverse that was already computed is returned. 
# If the match fails then a new solution to the inverse is computed.

cacheSolve <- function(x, y=xmaster) {
if (identical(x,y)) 
			{
				xinverse
			}
	else 
	{
		?sinkxinverse<<-solve(x)
		xmaster<<-x
		xinverse
	}
}

# below is command line capture demonstrating the speed of the code after it is executed once.
# > x<- matrix(round(runif(490000,min=50,max = 100),0),nrow=700,ncol=700)
# > x[1]
# [1] 54
# > xmaster[1]
# [1] 75
# > system.time(cacheSolve(x))
# user  system elapsed 
# 0.007   0.001   0.008 
# > xmaster[1]
# [1] 54
# > system.time(cacheSolve(x))
# user  system elapsed 
# 0       0       0 
=======
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
>>>>>>> 019b2117d4bffe912f57f0fa86db0393efa280d7
