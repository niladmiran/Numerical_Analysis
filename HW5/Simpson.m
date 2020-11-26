function integral_value = Simpson(f, a, b)
    %%%%%
%   This function implements the Simpson integral evaluation
    %%%%%
%   Parameter
%       f: function handle
%       a: left end point of the interval
%       b: right end point of the interval

%   Return
%       integral_value: float
%           The value calculated by Simpson algorithm

    integral_value = (b - a)/6.0 * (f(a) + 4 * f((a+b)/2) + f(b));
end