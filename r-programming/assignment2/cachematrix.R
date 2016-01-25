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
