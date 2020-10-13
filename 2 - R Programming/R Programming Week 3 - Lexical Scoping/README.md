### Introduction

This second programming assignment asked me to take advantage of the scoping rules in R to write an R
function that is able to cache potentially time-consuming computations.

### Assignment: Caching the Inverse of a Matrix

Write the following functions:

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.

For this assignment, I've assumed that the matrix supplied is always
invertible.

I've saved my code in the makeCacheMatrix.R file
