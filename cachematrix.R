## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }

get <- function() x
setinverse <- function(inverse) inv <<- inverse
getinverse <- function() inv
list(set = set, 
     get = get,
     setinverse = setinverse,
     getinverse = getinverse)	
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)) {
        # Simply return the computed inverse		
        message("Getting cached matrix")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    
    x$setinverse(inv)
    inv    
}
## test these two functions 
J_matrix<-makeCacheMatrix(matrix(1:4,2,2))
cacheSolve(J_matrix)
J_matrix$getinverse()
