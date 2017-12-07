%main display file
load('usps_all')
X = data;

for i=1:10
    X_test = X(:,:,i);
    X_test = X_test';
    displayData(X_test(1:10,:));
    pause;
end