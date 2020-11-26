%%% This script is for solving the problem 2 of Homework1, SI211.

clc;
clear;

x = linspace(1e-15, 1e-1);
% x = linspace(1e-15, 0.1, 10000000);
x = double(x);

f = @(x)(1 - cos(x)) ./ (x.^2);
f_0 = f(x);


%% plot yhe result
semilogx(x, f_0);
grid on
xlabel("x");
ylabel("f(x)");
title("Solution for problem 2");

% note that when you add the number of elements in x, for example,
% when you uncomment line 7 and comment line 6, run this program you
% will find that when x < 1e-8, the objec


