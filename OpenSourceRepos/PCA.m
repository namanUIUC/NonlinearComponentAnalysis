%% Solution for IE529 HW3-6

%% (a) Calculate the SVD of original data matrix A
clc; clear all;close all;
load('PCAdata.mat');
[U_orig,S_orig,V_orig] = svd(A);
% Note that one of three singular values of A is approximately
% zero(3.91e-15). It's reasonable to expect that PCA will project
% 3-dimentional data to 2-dimentional.
 
%% (b) Compute the PCA
[m,n] = size(A);
mu = mean(A,2); % compute the mean(s)
X = (A - repmat(mu,1,n))/sqrt(n-1); % de-biased, scaled data
covar = X * X'; % compute the covariance matrix including the scaling 1/(n-1)
[V_temp,D_temp] = eig(covar); % compute an eigenvalue decomposition
[D_vec,indx] = sort(diag(D_temp),'descend'); %sort eigenvalues in descending order
sel_ind = find(D_vec>1e-5);  % select non-zero eigenvalues
D = diag(D_vec(sel_ind)); % sorted and selected eigenvalue matrix
V = V_temp(:,indx(sel_ind)); % sorted and selected eigenvector matrix
X_pca = V' * X;
VV = V_temp(:,indx);
X_ppca = VV' * X;
% According to "indx", which represents the index of eigenvalues in
% descending order, and "D_vec" (eigenvalues), the third and the second features are the principal components

figure(1)
subplot(1,2,1);
scatter3(X(1,:),X(2,:),X(3,:)) % scatter de-biased, scaled data
title('De-biased, scaled data points')
xlabel('feature 1'); ylabel('feature 2'); zlabel('feature 3');
subplot(1,2,2);
scatter3(X_ppca(3,:),X_ppca(2,:),X_ppca(1,:))
title('PCA results for de-biased, scaled data points in 3D')
xlabel('feature 1'); ylabel('feature 2'); zlabel('feature 3');

figure(2)
scatter(X_pca(1,:),X_pca(2,:))
title('PCA results for de-biased, scaled data points in 2D')
xlabel('feature 3'); ylabel('feature 2'); 

%% (c) Direct SVD of the de-biased, scaled data
[U_norm,S_norm,V_norm] = svd(X); 
S_vec = diag(S_norm);
sel_ind_svd = find(S_vec>1e-5);
S = diag(S_vec(sel_ind_svd));
U = U_norm(:,sel_ind_svd);
X_svd = U'* X ;
X_ssvd = U_norm' * X;
figure(3)
subplot(1,2,1);
scatter3(X(1,:),X(2,:),X(3,:)) % scatter de-biased, scaled data
title('De-biased, scaled data points')
xlabel('feature 1'); ylabel('feature 2'); zlabel('feature 3');
subplot(1,2,2);
scatter3(X_ssvd(1,:),X_ssvd(2,:),X_ssvd(3,:))
title('PCA\_svd results for de-biased, scaled data points in 3D')
xlabel('feature 1'); ylabel('feature 2'); zlabel('feature 3');
figure(4)
scatter(X_ssvd(1,:),X_ssvd(2,:))
title('PCA\_svd results for de-biased, scaled data points in 2D')
xlabel('feature 1'); ylabel('feature '); 

% We got different signs of the first component (by comparing U (by PCA) and V (by SVD), or
% X_pca and X_svd). Basically, the sign of the components is arbitrary and
% does not matter. Please see 
% https://stats.stackexchange.com/questions/88880/does-the-sign-of-scores-or-of-loadings-in-pca-or-fa-have-a-meaning-may-i-revers
% for detailed discussion.