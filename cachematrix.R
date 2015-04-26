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

## In this code I took three diversions from the course example/suggestion.
## 1) I made the original and inverse matrix objects explicit
## 2) I creted an additional function to invert the original matrix
## 3) I changed most of the object names to more explicity stae their purpose

makeCacheMatrix <- function(matrixIN = matrix()) {
    
    # function to initialize the matrices
        initMatrixData <- function(matrixIN) {
            matrixData <<- matrixIN
            inverseData <<- NULL
        }
    
    # call the function to do the intialization
        initMatrixData(matrixIN)
    
    # function to retrieve the original matrix
        getMatrixData <- function() matrixData
    
    # function to set the inverse matrix to some data
        setInverseMatrix <- function(inverseData) {
            inverseData <<- inverseData
        }
    
    # function to retrieve the inverse matrix
        getInverseData <- function() inverseData
    
    # function to creteae (solve) the inverse from the original matrix
        solveMatrixData <- function(dataToSolve) {
            inverseData <<- solve(dataToSolve)
        }
    
    # return a list of the functions
        list(
            initMatrixData = initMatrixData,
            getMatrixData = getMatrixData,
            setInverseMatrix = setInverseMatrix,
            getInverseData = getInverseData,
            solveMatrixData = solveMatrixData
        )
}
## ------------------------------------------------------------------------------------------------------



## ------------------------------------------------------------------------------------------------------
## Function 2: "cacheSolve"
## Argument (required) : the list of functions (created by Function 1 "makeCacheMatrix") 

## This function creates a matrix of functions and the objects for the original and inversed matrices
## The matrix of functions are called by the caching function (below)

cacheSolve <- function(listOfFuncs, ...) {
    
    # retreve the current inverse data matrix
        inverseData <- listOfFuncs$getInverseData()
    
    # if the original matrix has already been solved - return the cached result
        if(!is.null(inverseData)) {
            message("getting cached data")
            return(inverseData)
        }
    
    # solve the original matrix (the inverse will be cached) and return the result
        return((listOfFuncs$solveMatrixData(listOfFuncs$getMatrixData())))
}
