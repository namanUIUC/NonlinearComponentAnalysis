% Create a random set of coordinates in a circle.
% First define parameters that define the number of points and the circle.
n = 500;
R = 20;
x0 = 0; % Center of the circle in the x direction.
y0 = 0; % Center of the circle in the y direction.
% Now create the set of points.
t = 2*pi*rand(n,1);
r = R*sqrt(rand(n,1));
x = x0 + r.*cos(t);
y = y0 + r.*sin(t);

data = [x,y];

for i=1:size(x)
    d = pdist([0,0;data(i,:)],'euclidean');
    if and(d > 4,d<8)
        x(i) = -999;
        y(i) = -999;
    end
    if and(d > 10,d<17)
        x(i) = -999;
        y(i) = -999;
    end
    if and(d > 19,d<20)
        x(i) = -999;
        y(i) = -999;
    end
end

x(x==-999) = [];
y(y==-999) = [];
data = [x,y];

% Now display our random set of points in a figure.
plot(x,y, 'o', 'MarkerSize', 5)
axis square;
grid on;
% Enlarge figure to full screen.
%set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
fontSize = 30;
xlabel('X', 'FontSize', fontSize);
ylabel('Y', 'FontSize', fontSize);
title('Random Locations Within a Circle', 'FontSize', fontSize);

save('rings.mat','data')