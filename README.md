# Percolation Threshold for a Square Maze

## Background
The practical problem of percolation originated from the passing of fluids through porous materials. For example – the passing of water through rock in the earth's surface. 

## The model
In our model, the porous material is a maze. We have sites, and bonds between them. In other words, we have 'towns and bridges'. The maze runner is our fluid. We burn some of the bonds (or 'bridges') by the Bernoulli distribution with constant p, and check for which p it is no longer possible to pass the maze. We expect that for bigger and bigger mazes, the graph of chance of passing as function of p will approach a step function (reverse heavy side function).

## The Code
I've used 2 function and 1 script to complete this calculation.
 
The function named 'has_been' simulates the progress of the runner in the maze.

The function 'yesorno' (yes or no) creates a maze, and calls 'has_been' to check if the runner can solve it. 

The script 'rec_per' (rectangular percolation) calls 'yesorno' many times, thereby creates many different mazes with different amount of bonds and checking the chance of success.

The threshold is found via the point on the graph where the inclination is strongest. 