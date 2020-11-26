%%% Thsi script is for solving problem 4 of Homework1, SI211C


h = logspace(-15, -1, 100);

% the initial point
x_0 = ones(length(h), 1)';
digit = 9;   % eps = 1e^(-(N+1))

% define the function 
f = @(x)exp(x);

f_x =f(x_0);    % exact values of f'(x)


% each term is rounded with 4 siginificant digits
f_x0 = round(f(x_0),digit);
f_xh = round(f(x_0 + h), digit);
f_xhh = round(f(x_0 + 2 * h), digit);
f_xhhh = round(f(x_0 + 3 * h), digit);
f_xhhhh = round(f(x_0 + 4 * h), digit);

% compute the approximation of f'(x)
f_approx = -25 * f_x0 + 48 * f_xh - 36 * f_xhh + 16 * f_xhhh - 3 * f_xhhhh;
f_approx = f_approx ./ (12 * h);

err = abs(f_x - f_approx);


semilogy(h, err, 'LineWidth', 2);
grid on
xlabel("h");
ylabel("Error");
title("The error related to h");

        