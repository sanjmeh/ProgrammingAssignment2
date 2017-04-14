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
