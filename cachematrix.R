## these functions are used to calculate the invers of a matrix
## 

## Creates a special kind of matrix that can cache it's inverse

makeCacheMatrix <- function(x = matrix()) {
  ## Initially the cache is null
  i <- NULL
  
  ## define setters and getters
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i

  ## return all setters and getters
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Calculates or retrieves from internal cache the inverse of a cachematrix created by the above function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  ## Check if inverse is already calculated and return it if it is
  if (!is.null(i)) {
    message("getting cached inverse matrix")
    return(i)
  }
  ## Otherwise solve the matrix and cache it before returning it
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i
}
