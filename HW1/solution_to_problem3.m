%% data
clc;
clear;

x = linspace(1e-15, 0.1);
x = double(x);


%% Problem 3 of Homework1, SI211
f_1 = maclaurin_expansion(1, x);
f_2 = maclaurin_expansion(2, x);
f_3 = maclaurin_expansion(3, x);



%% plot, solution to probelm 3
figure;
hold on
semilogx(x, f_1, 'LineWidth', 2);
semilogx(x, f_2, '-+', 'LineWidth', 2);
semilogx(x, f_3, 'LineWidth', 2);
ylim([0.4995,0.5005]);
hold off
xlabel("x");
ylabel("function values");
legend('n=1', 'n=2', 'n=3', 'Location','southeast');
title("f(x) and n-th taylor polynomial.")