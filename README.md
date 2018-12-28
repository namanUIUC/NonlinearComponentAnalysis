# Nonlinear Component Analysis as a Kernel Eigenvalue Problem
Course project for [IE529: Stats of Big data & Clustering](https://ise.illinois.edu/courses/profile/IE529-120168), 2017 Fall, UIUC

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/namanUIUC/NonlinearComponentAnalysis/master)

## Our team member
| Name           | Guthub Homepage                           |
|----------------|-------------------------------------------|
| Jvn Karthik    | N/A                                       |
| Naman Shukla   | [namanUIUC](https://github.com/namanUIUC) |
| Shubham Bansal | N/A                                       |
| Zhenye Na      | [Zhenye-Na](https://github.com/Zhenye-Na) |
| Ziyu Zhou      | [Ziyu0](https://github.com/Ziyu0)         |

## Our primary work
We implemnt the experiments presented in the paper Nonlinear Component Analysis as a Kernel Eigenvalue Problem by Bernhard Schölkopf, Alexander Smola, Klaus-Robert Müller. Also, we write our own example on Kernel PCA. In this regard, you can read our report and our presentation slides.

## Dependencies
In order to run the experiments, make sure you have all dependencies installed
- matplotlib (>= 2.0.0)
- scipy (>=0.19.0)
- numpy (>=1.12.1)
- sklearn (>=0.0)

You can install them by typing

`pip3 install 'whatever you need'`

The prgramming languages we use are Python and MATLAB. If you do not have access to MATLAB on your laptop. We advise you to install `Octave` instead. You can refer to [this](https://www.gnu.org/software/octave/download.html) webpage for installing.

## Experiments in paper
In the paper, there are two major experiments:
- Toy example: 4-degree Polynomial Kernel PCA
- Character Recognition (USPS Dataset)

### Toy example: 4-degree Polynomial Kernel PCA
We implemented this part with MATLAB. The code can be found [here](https://github.com/namanUIUC/NonlinearComponentAnalysis/blob/master/KPCA-projectcode/kpca_code.m).

## Project implementation
### SVM and KPCA on Iris Dataset
Principal Component Analysis (PCA) is a dimensionality reduction technique that is used to transform and a high-dimensional dataset into a smaller dimensional subspace to give a directed impression of the dataset prior to running a machine learning algorithm on the data. The Iris dataset is in a 4 th dimensions (features) of three different iris flower species. 

Related codes can be found [here](https://github.com/namanUIUC/NonlinearComponentAnalysis/blob/master/application/SVM_on_Iris.ipynb).

### SVC on USPS Dataset
The dataset contains numeric data obtained from the scanning of handwritten digits from envelopes by the U.S. Postal Service. The original scanned digits are binary and of diﬀerent sizes and orientations; the images here have been deslanted and size normalized, resulting in 16 × 16 grayscale. We will ﬁrst extract features via Kernel PCA and apply that to a SVM classiﬁer to train and test on the splitted USPS dataset.

Related codes can be found [here](https://github.com/namanUIUC/NonlinearComponentAnalysis/blob/master/application/SVC_on_USPS.ipynb).
