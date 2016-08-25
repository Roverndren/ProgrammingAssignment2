## This is my submission for Assignment 2.
## In this Assignment we create two functions:
## 1. makeCacheMatrix - 
## This function creates a special "matrix" object that can cache its inverse.
## 2. cacheSolve - 
## This function computes the inverse of the special "matrix" returned by  
## makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then cacheSolve retrieves the inverse from the cache.


## This function creates a special "matrix" object that can cache its inverse.
## Example usuage:  y <- makeCacheMatrix(matrix(c(1,0,5,2,1,6,3,4,0),3,3))

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


## This function returns a matrix that is the inverse of 'x' 
## Example usuage: assuming 
## y <- makeCacheMatrix(matrix(c(1,0,5,2,1,6,3,4,0),3,3))
## then cacheSolve(y) will return the inverse
## kindly note that when testing whether the inverse itself
## is correct, you need to apply the matrix multiplication operator %*%
## instead of the element wise multiplication operator *

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
