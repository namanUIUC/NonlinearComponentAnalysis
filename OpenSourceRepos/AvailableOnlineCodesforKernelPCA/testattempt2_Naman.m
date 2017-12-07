clear all;
clc;
load('usps_all')
X = data;
% load ('ex7faces.mat')
X = X(1:100,:);
for i=1:10
    X_test = X(:,:,i);
    X_test = X_test';
    displayData(X_test(1:1100,:));
    pause;
end

%X_test = X(:,:,1);
%X_test = X_test';
%%[mappedX, mapping, k, L, V] = kernel_pca(double(X_test(1:500,:)), 256);
% data_in = double(X_test(1:500,:)');
% num_dim = 256;
% [data_out, K] = kernelpca_tutorial(data_in,num_dim);
%X = double(X_test(1:500,:));
% no_dims = 100;
% 
% kernel = 'linear';
% param1 = 1;
% param2 = 3;
% 
% 
% % Store the number of training and test points
% ell = size(X, 1);
% 
% if size(X, 1) < 2000
%     
%     % Compute Gram matrix for training points
%     disp('Computing kernel matrix...');
%     K = gram(X, X, kernel, param1, param2);
%     
%     % Normalize kernel matrix K
%     mapping.column_sums = sum(K) / ell;                       % column sums
%     mapping.total_sum   = sum(mapping.column_sums) / ell;     % total sum
%     J = ones(ell, 1) * mapping.column_sums;                   % column sums (in matrix)
%     K = K - J - J';
%     K = K + mapping.total_sum;
%     
%     % Compute first no_dims eigenvectors and store these in V, store corresponding eigenvalues in L
%     disp('Eigenanalysis of kernel matrix...');
%     K(isnan(K)) = 0;
%     K(isinf(K)) = 0;
%     [V, L] = eig(K);
%     V_k = V;
%     L_k = L;
% else
%     % Compute column sums (for out-of-sample extension)
%     mapping.column_sums = kernel_function([], X', 1, kernel, param1, param2, 'ColumnSums') / ell;
%     mapping.total_sum   = sum(mapping.column_sums) / ell;
%     
%     % Perform eigenanalysis of kernel matrix without explicitly
%     % computing it
%     disp('Eigenanalysis of kernel matrix (using slower but memory-conservative implementation)...');
%     options.disp = 0;
%     options.isreal = 1;
%     options.issym = 1;
%     [V, L] = eigs(@(v)kernel_function(v, X', 1, kernel, param1, param2, 'Normal'), size(X, 1), no_dims, 'LM', options);
%     disp(' ');
% end
% 
% % Sort eigenvalues and eigenvectors in descending order
% [L, ind] = sort(diag(L), 'descend');
% L = L(1:no_dims);
% V = V(:,ind(1:no_dims));
% 
% % Compute inverse of eigenvalues matrix L
% disp('Computing final embedding...');
% invL = diag(1 ./ L);
% 
% % Compute square root of eigenvalues matrix L
% sqrtL = diag(sqrt(L));
% 
% % Compute inverse of square root of eigenvalues matrix L
% invsqrtL = diag(1 ./ diag(sqrtL));
% 
% % Compute the new embedded points for both K and Ktest-data
% mappedX = sqrtL * V';                     % = invsqrtL * V'* K
% 
% % Set feature vectors in original format
% mappedX = mappedX';
% 
% % Store information for out-of-sample extension
% mapping.X = X;
% mapping.V = V;
% mapping.invsqrtL = invsqrtL;
% mapping.kernel = kernel;
% mapping.param1 = param1;
% mapping.param2 = param2;
% 
% recovered = mappedX * V';