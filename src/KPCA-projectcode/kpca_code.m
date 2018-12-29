clear all;
clc;

% loading data
load('usps_all')

% TEST DATA : M(observation/sample points) x N(features/dimensions)
X_test = double(data(:, 1:800, 1)');

% Center Data
mu = mean(X_test);
X_centered = bsxfun(@minus, X_test, mu);

% Define kernel
kernel = 'linear';
n= 3;

%Def: M and N
M = size(X_centered,1);
N = size(X_centered,2);

% Create matrix K
switch kernel
    case 'poly'
        K = (X_centered*X_centered').^n;
        
    case 'linear'
        K = X_centered*X_centered';
        
    case 'gauss'
        % Using the Gaussian Kernel to construct the Kernel K
        % K(x,y) = -exp((x-y)^2/(sigma)^2)
        % K is a symmetric Kernel
            K = zeros(M,M);
            for row = 1:(M)
                for col = 1:row
                    temp = sum(((X_centered(row,:) - X_centered(col,:)).^2));
                    K(row,col) = exp(-temp); % sigma = 1
                end
            end
            K = K + K'; 
            
            % Dividing the diagonal element by 2 since it has been added to itself
            for row = 1:(M)
                K(row,row) = K(row,row)/2;
            end
    otherwise
        error('Unknown kernel function.');
end

% Centering of K in F space
one_mat = ones(size(K))./M;
K_center = K - one_mat*K - K*one_mat + one_mat*K*one_mat;

% Eigen values and vectors for K_centered (i.e. lamda.M and alpha)
[V_K,D_K] = eig(K_center);
eigval_K = real(diag(D_K));
eigvec_K = real(V_K);

% Sorting Eigen Vectors w.r.t Eigen Values of K
% (Bubble sort)
Sorted_eigval_K=eigval_K;
Sorted_eigvec_K=eigvec_K;
n = length(Sorted_eigval_K);
while (n > 0)
    
    % Iterate through x
    nnew = 0;
    for i = 2:n
        
        % Swap elements in wrong order
        if (Sorted_eigval_K(i) > Sorted_eigval_K(i - 1))
            Sorted_eigval_K = swap(Sorted_eigval_K,i,i - 1);
            Sorted_eigvec_K(:,[i-1 i]) = Sorted_eigvec_K(:,[i i-1]);
            nnew = i;
        end
    end
    n = nnew;
end


% Calculate lamda
lamda = (Sorted_eigval_K)./M;

% Select 99 percent of the cumulative eigen values (dim = dimensions k)
dim = 0;
percent = 0;
for indx=1:size(lamda)
    if percent < 0.90
        dim = dim + 1;
    else
        break;
    end
    percent = sum(lamda(1:indx))/sum(lamda);
end
        
% Normalize all the alpha (i.e. normalizing all significant sorted eigen vectors of K )
lamda = lamda(1:dim);
alpha = Sorted_eigvec_K(:,1:dim);

for indx=1:dim
    alpha(:,indx)=alpha(:,indx)./dot(alpha(:,indx),alpha(:,indx));
    alpha(:,indx)=alpha(:,indx)./sqrt(lamda(indx));
end


% Project data
data_out = zeros(dim,M);
for count = 1:dim
    data_out(count,:) = alpha(:,count)'*K_center';
end
data_out = data_out';


% FUNCTION USED TO SWAP WHILE SORTING (Not relevent for pca)
function x = swap(x,i,j)

% Swap x(i) and x(j)
% Note: In practice, x should be passed by reference

val = x(i);
x(i) = x(j);
x(j) = val;

end
