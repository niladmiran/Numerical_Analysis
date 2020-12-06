%%% Using Newton method to solve the problem

%% Configuration

clc;
clear;

MAX_ITER = 200;
x = zeros(1, MAX_ITER);
y = zeros(1, MAX_ITER);
value_f = zeros(1, MAX_ITER);

% initialization
x(1) = -1;
y(1) = -1;


%% Run algorithm
% Note:
tic
for k = 1:MAX_ITER-1
    R = [x(k)-1, 10*(y(k)-x(k)^2), y(k)]';
    value_f(k) = 0.5 * norm(R, 2)^2;
    gradient_f = [x(k) - 1 - 200*x(k) * (y(k)- x(k)^2);...
                 100* (y(k)- x(k)^2)+ y(k)];
    fprintf("At %d iteration: the square of norm of the graident is %.6f\n", ...
                    k, norm(gradient_f)^2);        
    if norm(gradient_f)^2 <= 1e-3
        fprintf("The algorithm stops at %d iterations!\n", k);
        max_k = k;
        break;
    else
        % exact Hessian
        hessian_f = [600* x(k)^2- 200* y(k)+ 1, -200* x(k); -200* x(k), 101];

        temp = hessian_f \ gradient_f;
        x(k+1) = x(k) - temp(1);
        y(k+1) = y(k) - temp(2);
    end

    
end
toc



%% plot 
f = @(x,y) 0.5 * (x-1).^2 + 0.5*(10*(y-x.^2)).^2 + 0.5*y.^2;
fc = fcontour(f);
fc.LineWidth = 2;
fc.LevelList = [50 10 1 0.1 0.01];
colorbar
xlim([-3,3]);
ylim([-1.5,5]);
grid on
hold on 
plot(x(1:max_k),y(1:max_k), 'r-x', 'LineWidth', 2);
xlabel('x');
ylabel('y');
legend('Contour','Newton method');
title('Iteration of Newton method,')
             