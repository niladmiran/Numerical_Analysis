%% This script aims to solve problem 5, Homework2, SI211

%% data preparation
clc;
clear;


% please make sure that the vector x, y, u are all column vectors!
x = -5:5;
x = x';
u = linspace(-5,5);
u = u';

% the initial function
f_1 = @(x)sin(x);
f_2 = @(x)(1./(1+x.^2));

% change f between f_1 or f_2 to determine the target function
f = f_1;
y = f(x);

%% Use Lagrange interpolation algorithm to solve this problem
pred_y = lagrange(x, y, u);


%% plot the result
plot(u, pred_y,'b:', 'LineWidth', 2);
hold on
plot(u, f(u), 'r-', 'LineWidth', 2);
xlabel("x");
ylabel("f(x)")
legend("Interpolation", "f(x)");
title("Lagrange interpolation for f(x)");
grid on
% axis([0.5 8.5 -5 5])