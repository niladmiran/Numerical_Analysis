
%% Configuration
clc;
clear;

f = @(x)exp(x);

exact = integral(f, 0, 4);


Simpson_vals = zeros(length(1:100), 1);


%% run algorithm
for N = 1:100
    for j = 0 : N-1
        Simpson_vals(N) = Simpson_vals(N) + Simpson(f, 4*j/N, 4*(j+1)/N);
    end
end

%% plot
Errors = abs(Simpson_vals - exact * ones(length(1:100), 1));
semilogy(1:100, Errors);
xlabel('N');
ylabel('Absolute error');
title("The absolute error of Simpson method againt N");

%% plot second plot
% bounds = 16 * exp(4) ./ (45 * (1:100));

bounds = zeros(length(1:100), 1);
for N = 1:100
    temp = exp(4/N);
    bounds(N) = (16*temp*(1-temp^N))/(45*N^5*(1-temp));
end

Errors = abs(Simpson_vals - exact * ones(length(1:100), 1));
semilogy(1:100, Errors, '+-', 'linewidth', 2);
hold on
semilogy(1:100, bounds, 'linewidth', 2);
xlabel('N');
legend("Absolute error", "Bounds")
title("The absolute error of Simpson method againt N");

