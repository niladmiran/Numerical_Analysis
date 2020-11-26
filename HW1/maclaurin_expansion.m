function f = maclaurin_expansion(n, x)
% this function expand f in probelm 3, SI211 in different order, which 
% is gievn by n, that is
% f = 1/2 +1/24x^2-1/720x^4+...+(-1)^n/((2n)!)x^{2n-2}

% Parameter
%   n: a positive integer
%       how many terms we need to expand f
%   x: an array 
%       the point we want to approximate

% Return 
%   f: an array of same size as x
%       the approximate value of f


    N = length(x);
    f = 1/2 * ones(1, N);
    if n == 1
        return
    end
    coef = 1/24;
    for i = 2: n
        f = f + coef * x.^(2*i-2);
        coef = coef / ((2 * i + 1) * (2 * i + 2));
    end

end