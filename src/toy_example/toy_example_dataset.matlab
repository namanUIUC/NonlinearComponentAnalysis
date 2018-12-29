data = zeros(600, 2);

% first dataset
% -------------------------------------------------------------------- %
n1 = 200; 				% number of points that you want
center = [0, 0]; 		% center coordinates of the circle [x0,y0] 
radius1 = 2; 			% radius of the circle
angle1 = 2 * pi * rand(n1, 1);


r1 = radius1 * sqrt(rand(n1, 1));
X1 = r1 .* cos(angle1) + center(1);
Y1 = r1 .* sin(angle1) + center(2);

data(1:n1, 1) = X1;
data(1:n1, 2) = Y1;



% second dataset
% -------------------------------------------------------------------- %
n2 = 200;
radius2 = 10;			% radius of the circle
angle2 = 2 * pi * rand(n2, 1);

r2 = radius2 * sqrt(rand(n2, 1));
X2 = r2 .* cos(angle2) + center(1);
Y2 = r2 .* sin(angle2) + center(2);


data((n1 + 1):n1+n2, 1) = X2;
data((n1 + 1):n1+n2, 2) = Y2;



n3 = 200;
radius3 = 30;			% radius of the circle
angle3 = 2 * pi * rand(n3, 1);

r3 = radius3 * sqrt(rand(n3, 1));
X3 = r3 .* cos(angle3) + center(1);
Y3 = r3 .* sin(angle3) + center(2);


data((n1 + n2 + 1):n1+n2+n3, 1) = X3;
data((n1 + n2 + 1):n1+n2+n3, 2) = Y3;


plot(data(1:end, 1), data(1:end, 2),'.k')