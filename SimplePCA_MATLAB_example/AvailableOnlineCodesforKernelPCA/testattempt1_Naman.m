load('usps_all')
X = data;

for i=1:10
    X_test = X(:,:,i);
    X_test = X_test';
    displayData(X_test(1:1100,:));
    pause;
end
X_test = X(:,:,1);
X_test = X_test';
%[mappedX, mapping, k, L, V] = kernel_pca(double(X_test(1:500,:)), 256);
data_in = double(X_test(1:500,:)');
num_dim = 256;
[data_out,eigvec,K] = kernelpca_tutorial(data_in,num_dim);

rec = data_out*eigvec(:,1:num_dim);