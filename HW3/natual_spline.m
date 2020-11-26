function [a, b, c, d] = natual_spline(x0, xN, N, init_func)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % This function aims to implement the algorithm 3.4:
    % Natural Cubic Spline in <<Numerical Anslysis>> 9th.
    % But with a interval [x0, xN] and a fix length h of subinterval
    % that is, x_i = x0 + i*h
    
    % Parameters:
    %   x0: left endpoint of the interval
    %   xN: right endpoint of the interval
    %   N: The number of intervals in [x0, xN]
    %   init_func: function handle
    %             the function we need to interpolate
    
    % Return
    %   a, b, c, d: an array-like, shape=[N, 1]
    %       the cubic spline function coefficient in each subinterval 
    %           [x_i,x_{i+1}]
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % step 1
    h = (xN - x0) / N;
    x = x0 : h: xN;
    a = init_func(x);
    % step 2
    alpha = 3/h * (a(3:end) - 2 * a(2:end-1) + a(1:end-2));
    
    % Use Theorem 3.11 to solve c
    % the coefficient matrix
    A = diag(4*h*ones(N-1,1)) + diag(h*ones(N-2, 1), 1) + diag(h*ones(N-2, 1), -1);
    c = (A\alpha')';
    c = [0, c, 0];
    
    % step 6
    b = (a(2:end) - a(1:end-1)) / h - h/3 * (c(2:end) + 2*c(1:end-1));
    d = (c(2:end) - c(1:end-1)) / (3 * h);
end
    
    
    
    