source("cachematrix.R")

mat <- matrix(c(1, 0.1, 0.5,
                0.1, 1, 0.9,
                0.5, 0.9, 1), ncol = 3)


cacheable.mat <- makeCacheMatrix(mat)

inverse <- cacheSolve(cacheable.mat)

print(inverse)

# those should print the message 'getting cached inverse matrix'
cacheSolve(cacheable.mat)
cacheSolve(cacheable.mat)