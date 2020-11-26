clc;
clear;


w = linspace(1e-5,1e3, 10000);
len_w = length(w);

w_exact = zeros(len_w,1);
w_approx = zeros(len_w,1);


%% Run algorithm 
for i = 1 : len_w
    w_exact(i) = sin(w(i)*pi/4)/w(i);
    w_approx(i) = pi/8*(cos(w(i)*pi*(sqrt(3)-1)/(8*sqrt(3)))+...
        cos(w(i)*pi*(sqrt(3)+1)/(8*sqrt(3))));
end

%% plot the result
semilogx(w, w_exact, '+-', 'LineWidth', 2);
hold on
semilogx(w, w_approx);
xlabel('\omega');
ylabel('the solution');
legend('Exact solution I', 'Approximate solution');
title('Figure of two kind of solutions');
hold off

%% plot the error 
semilogx(w, abs(w_exact-w_approx), 'LineWidth', 2)
xlabel('\omega');
ylabel('|I_1-I|');
title('The approximation error of the Gauss Quadrature method');


