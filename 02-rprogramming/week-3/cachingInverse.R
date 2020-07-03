makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y       # Assign value to variable x outside set function scope
    inv <<- NULL  # Assign value to variable inv outside set function scope
  }
  
  get <- function(){
    x
  } 
  
  setInverse <- function(inverse){
    inv <<- inverse
  } 
  getInverse <- function() inv
  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

cacheSolve <- function(x, ...) {
  # Retrieve cache
  inv <- x$getInverse()
  
  # If inverse matrix already exist then return to the cached matrix
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  # Do the computation if cache does not exist
  data <- x$get()
  inv <- solve(data, ...)
  x$setInverse(inv)
  
  inv
}