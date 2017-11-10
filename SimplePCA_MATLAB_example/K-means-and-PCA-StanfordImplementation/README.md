K-means-and-PCA
===============

An exercise on K-means clustering algorithm &amp; Principle Component Analysis, and their application to image compression.  It is programming exercise 7 in Machine Learning course by Andrew Ng on Coursera.

In this exercise, the K-means clustering algorithm will be implemented and to apply it to compress an image.  In the second part, principal component analysis will be used to find a low-dimensional representation of face images.

The course info can be found here https://class.coursera.org/ml-004/class/index.  
The details of this assignment is described in ex7.pdf.

The codes are written by Octave.
For further info of Octave please see http://www.gnu.org/software/octave/

This set include the following functions:

ex7.m - Octave/Matlab script for the first exercise on K-means  
ex7 pca.m - Octave/Matlab script for the second exercise on PCA  
ex7data1.mat - Example Dataset for PCA  
ex7data2.mat - Example Dataset for K-means  
ex7faces.mat - Faces Dataset  
bird small.png - Example Image  
displayData.m - Displays 2D data stored in a matrix  
drawLine.m - Draws a line over an exsiting figure  
plotDataPoints.m - Initialization for K-means centroids  
plotProgresskMeans.m - Plots each step of K-means as it proceeds  
runkMeans.m - Runs the K-means algorithm  
pca.m - Perform principal component analysis  
projectData.m - Projects a data set into a lower dimensional space  
recoverData.m - Recovers the original data from the projection  
findClosestCentroids.m-Findclosestcentroids(usedinK-means)  
computeCentroids.m - Compute centroid means (used in K-means)  
kMeansInitCentroids.m - Initialization for K-means centroids
