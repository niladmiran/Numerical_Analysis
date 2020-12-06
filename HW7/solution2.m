clc;
clear;

f = @(x)(x^3+2*x+2);
df = @(x)(3*x^2+2);

x = zeros(102,1);

for i = 1: 101
    x(i+1) = x(i)-f(x(i))/df(x(i));
    fprintf("i = %3d, x(%3d) = %10.8f, f(x(%3d)) = %10.8f, f'(x(%3d)) = %10.8f.\n",...
        i-1, i, x(i), i, f(x(i)), i, df(x(i)));
end