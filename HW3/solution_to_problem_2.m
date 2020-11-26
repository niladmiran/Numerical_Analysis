clc;
clear;

% configuration
x0 = -5;
xN = 5;
N = 10;
h = (xN - x0) / N;

% target function
f = @(x)(1./(1+x.^2));

num = 101;

% exact solution
x = linspace(-5, 5, num);
exact_f = f(x);

% natural cubic spline
[a, b, c, d] = natual_spline(x0, xN, N, f);
y_ncs = zeros(1, length(x));

% Lagrange interpolation
pred_y = lagrange((x0:h:xN)', f((x0:h:xN)'), x');

for i = 1:N
    x_left = x0 + (i-1)*h;
    x_right = x0 + i*h;
    ind = ((x >= x_left) & (x <= x_right));
    
    y_ncs(ind) = a(i) * ones(1, sum(ind)) + b(i) * (x(ind)-x_left) + ...
        c(i) * (x(ind)-x_left).^2 + d(i) * (x(ind)-x_left).^3;
end


%% plot 
plot(x, exact_f, 'r--', 'linewidth', 2);  
hold on 
plot(x, y_ncs, 'g', 'linewidth', 2);
plot(x, pred_y', 'linewidth', 2);
xlabel('x');
ylabel('y');
legend('exact', 'cubic spline', 'Lagrange', 'location', 'best');
title('Solution to Problem2, HW3')

