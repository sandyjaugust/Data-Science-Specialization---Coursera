## For a very large square matrix, it may take too long to compute its inverse,
## especially if it has to be computed repeatedly. The makeCacheMatrix & cacheSolve
## functions allow us to calculate the inverse of a square matrix, cache it, and
## quickly reference it again for future computations. These functions eliminate the
## need to repeatedly recalculate the inverse of a square matrix.

## makeCacheMatrix creates a special "matrix", which is really a list containing
## a function that:
## 1.  sets the value of the matrix
## 2.  gets the value of the matrix
## 3.  sets the value of the inverse
## 4.  gets the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL ## create NULL variable to store the inverse of X, our matrix
    set <- function(y){
        x <<- y
        i <<- NULL
    } ## This function caches our matrix (x) into a value y.
    ## It also sets the inverse (i) for our cached matrix to NULL, since
    ## a newly set matrix's inverse has not yet been calculated
    get <- function() x ## The get function returns our cached matrix, x
    setinverse <- function(inverse) i <<- inverse ## sets the inverse as i
    getinverse <- function() i ## returns the cached inverse
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## The following function calculates the mean of the special "matrix"
## created with the above function. However, it first checks to see if the
## inverse has already been calculated. If so, it `get`s the inverse from the
## cache and skips the computation. Otherwise, it calculates the inverse of
## the data and sets the value of the inverse in the cache via the `setinverse`
## function.

cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)){
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}