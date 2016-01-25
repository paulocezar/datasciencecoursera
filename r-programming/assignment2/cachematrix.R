## Functions for working with matrices and it's inverses.
## Once the inverse of a matrix is calculated this inverse is cached
## so rather than computing it repeatedly everytime needed we can just reuse
## the cached value.


## Creates a special "matrix" object that can cache its inverse.
## `set` and `get` functions on the special "matrix" can be used for
## setting a new value to the matrix and getting the matrix data.
## `setinv` and `getinv` functions can be used for setting and getting
## the cached inverse related to that special matrix.

makeCacheMatrix <- function(x = matrix()) {
  cached_inv <- NULL
  set <- function(y) {
    x <<- y
    cached_inv <<- NULL
  }
  get <- function() x
  setinv <- function(inv) cached_inv <<- inv
  getinv <- function() cached_inv
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## Computes the inverse of a special "matrix" created by `makeCacheMatrix`.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cached inverse is retrieved without new calculations.

cacheSolve <- function(x, ...) {
 inv = x$getinv()
 if (!is.null(inv)) {
   return(inv)
 }
 data <- x$get()
 inv <- solve(data)
 x$setinv(inv)
 inv
}
