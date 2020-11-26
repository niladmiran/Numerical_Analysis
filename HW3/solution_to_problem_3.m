%% configuration
clc;
clear;

syms x

x_int = -5:1:5;
len = length(x_int);

f = @(x)(1./(1+x.^2));
f_x = f(x_int);

%% calculate $p$
p = 0;
for i = 1:len
    temp = 1;
    for j = 1:len
        if j ~= i
            temp = temp * (x-x_int(j)) / (x_int(i)-x_int(j));
        end
    end
    p = p + f_x(i) * temp;
end


%% calculate the integral
p_diff_2 = diff(p,2);
result = int(p_diff_2^2, -5, 5)