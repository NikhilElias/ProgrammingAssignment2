## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
         inv <- NULL                             ## initialize inv as NULL; inv will hold the value of matrix inverse 
    set <- function(y) {                    ## define the 'set' function to assign the new 
        x <<- y                             ## value of matrix in parent environment
        inv <<- NULL                        ## if there is a new matrix, reset inv to NULL
    }
    get <- function() x                     ## define the get function which returns the value of the matrix argument
    
    setinverse <- function(inverse) inv <<- inverse  ## assigns value of inv in parent environment
    getinverse <- function() inv                     ## gets the value of inv when called
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)  ## you need this in order to refer 
                                                                                  ## to the functions with the $ operator

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
    if(!is.null(inv)) {                         ## if inverse is not null
        message("getting cached data")          ## print "getting cache data"
        return(inv)                             ## return the inverse matrix
    }
    data <- x$get()
    inv <- solve(data, ...)                     ## use the solve function to get the inverse of the matrix
    x$setinverse(inv)
    inv
}
