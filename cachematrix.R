## This is my submission for Assignment 2.
## In this Assignment we create two functions:
## 1. makeCacheMatrix - 
## This function creates a special "matrix" object that can cache its inverse.
## 2. cacheSolve - 
## This function computes the inverse of the special "matrix" returned by  
## makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then cacheSolve retrieves the inverse from the cache.


## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
matinv <<- NULL

 get <- function() x

 set <- function(y) {
  x <<- y
  matinv <<- NULL
 }

 getinv <- function() matinv
 setinv <- function(newmatinv) matinv <<- newmatinv

list(get = get, set = set, getinv = getinv, setinv = setinv)
}


## Returns a matrix that is the inverse of 'x' 
cacheSolve <- function(x, ...) {
matinv = x$getinv()
if(!is.null(matinv)) 
 {
   message("getting cached data")
   return(matinv)
 }

 data <- x$get()
 matinv <- solve(data, ...)
 x$setinv(matinv)
 matinv

}
