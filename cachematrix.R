## ------------------------------------------------------------------------------------------------------
## Coursera R Programming Week 3 Programming Assignemnt (#2)
## 
## Two functions to cache the inverse of a matrix
## ------------------------------------------------------------------------------------------------------

## ------------------------------------------------------------------------------------------------------
## Function 1: "makeCacheMatrix"
## Argument (optional) : the initial matrix to be inversed and cached

## This function creates a matrix of functions and the objects for the original and inversed matrices
## The matrix of functions are called by the caching function (below)

makeCacheMatrix <- function(mtrix = matrix()) {
    
    # insure the inverse matrix is initialized
        inverseMtrix <- NULL
        
    # function to initialize the matrices
        initMtrix <- function(matrixData) {
            mtrix <<- matrixData
            inverseMtrix <<- NULL
        }
    
    # function to retrieve the matrix
        getMtrix <- function() mtrix
    
    # function to set the inverse matrix to some data
        setInverse <- function(inverseData) {
            inverseMtrix <<- inverseData
        }
    
    # function to retrieve the inverse matrix
        getInverse <- function() inverseMtrix
    
    # function to creteae (solve) the inverse from the original matrix
        solveMtrix <- function(dataToSolve) {
            inverseMtrix <<- solve(dataToSolve)
        }
    
    # return a list of the functions
        list(
            initMtrix = initMtrix,
            getMtrix = getMtrix,
            setInverse = setInverse,
            getInverse = getInverse,
            solveMtrix = solveMtrix
        )
}
## ------------------------------------------------------------------------------------------------------



## ------------------------------------------------------------------------------------------------------
## Function 2: "cacheSolve"
## Argument (required) : the list of functions (created by Function 1 "makeCacheMatrix") 

## This function creates a matrix of functions and the objects for the original and inversed matrices
## The matrix of functions are called by the caching function (below)

cacheSolve <- function(funcs, ...) {
    
    # retreve the current inverse data matrix
        inverseData <- funcs$getInverse()
    
    # if the original matrix has already been solved - return the cached result
        if(!is.null(inverseData)) {
            message("getting cached data")
            return(inverseData)
        }
    
    # solve the original matrix (the inverse will be cached) and return the result
        return( funcs$solveMtrix ( funcs$getMtrix() ) )
}
