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
    message("getting cached data:",head(round(invrs,2),1))
    return(invrs)
  }
  data <- x$get()
  st<-paste(data[1],data[2],data[3],"...")
  message("computing the inverse of",":",st)
  invrs <- solve(data,...)
  x$setInvrs(invrs)
  invrs
}

a<- round(matrix(runif(100,10,20),nrow=10,ncol=10),0)
object_a<-makeCacheMatrix(a)
inv_a<-cacheSolve(object_a)
#id1<- round(inv_a %*% a,0)

b<-a
object_b<-makeCacheMatrix(b)
inv_b<-cacheSolve(object_b)


# id2<- round(inv_b %*% b,0)
# if(identical(id1,id2)) {
#   message("matrix inversion successful both times")
# }


