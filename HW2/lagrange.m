function pred_y = lagrange(x, y, u)
% This function aims to implement the Lagrange interpolation

%   Parameter:
%       x: N-by-1 vector
%       y: N-by-vector
%            (x,y) are given N data points (x(i), y(i))), with which we need 
%            to find a Lagrange polynomial  P(x) to fit these data points,
%            i.e, P(x(i))=y(i).
%       u: M-by-1 vector
%            the new data points, of which values we want to predict

%   Output:
%       pred_i: M-by-1 vector
%           the function value at u estimated by Lagrange polynomial, that
%           is, P(u(i))=pred_y(i)

    N = length(x);
%     temp = ones(length(u), 1);
    pred_y = zeros(length(u), 1);
    for i = 1:N
        temp= ones(length(u), 1);
        for j = 1 : N
            if j ~= i
                temp = temp .* (u-x(j))/(x(i) - x(j));
            end
        end
        pred_y = pred_y + y(i) * temp;
    end