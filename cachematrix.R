#########################
#Second Progrmming Assignment
#Lexical Scoping

#makeCacheMatrix (mcm)-- function to 
#1.) create a special 'matrix' object
#2.) solve for it's inverse
#3.) cache the result (inverse of the matrix)

# How to use: type makeCacheMatrix(4,2,2) (Please use an invertable matrix.)
makeCacheMatrix <- function(n = 4, r = 2, c = 2) {
        
        test.env <- new.env (parent = .GlobalEnv)
        special.matrix <<- matrix(rnorm(n),r ,c)
        special.matrix.inverse <<- solve(special.matrix)
        print("The matrix is:")
        print(special.matrix)
        print("")
        print("The inverse of the matrix is:")
        print(special.matrix.inverse)
}

# cacheSolve (cs) -- another function
#1.) computes the inverse of the special matrix
#2.) checks cache for the inverse of 'CacheMatrix'
#3.) checks if 'CacheMatrix' has changed
#4.) if (2 AND 3 == TRUE) retrieve the stored inverse ELSE store the new matrix and solve for the inverse with 'solve' and then cache answer
#5.) Subsequently store the inverse.

# Note: Several rules and assumptions have been made/set in order to write this code.
# First, both the original matrix and its inverse are stored in the cache in .GlobalEnv.
# This allows checking against the stored matrix without having to recalculate the inverse again.
# That would be redundant.
# Assumption 1: the cached matrix or inverse have not been overwritten in singularity.
# Assumption 2: if one is written or overwritten the other is also changed.
# Assumption 3: The inverse matrix is stored ONLY as a result of a calculation made to a stored matrix prime.
# Assumption 4: The values will be cached to the global environment.
# Note: At first I was going to create an alternate environment 'test.env'; however,
# The instruction example used <<- to write to the .GlobalEnv.
# Usage: Please run cacheMatrix first.

cacheSolve <- function (matrix.query = special.matrix){ #Enter the matrix to query
        if (exists('special.matrix')){
                if (identical(matrix.query, special.matrix)) {
                        print("Cached Result: Here is the inverse of the queried matrix.")
                        print(special.matrix.inverse)
                } else {
                        print("The result was not cached. Solving for the inverse.")
                        
                        special.matrix <<- matrix.query
                        special.matrix.inverse <<- solve(special.matrix)
                        
                        print("The inverse is")
                        print(special.matrix.inverse) 
                }  
        }           
        
}

# Thank you.
#---------------------------------------------------------------
#################################################################

