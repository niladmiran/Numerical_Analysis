% solution to problem 4
%% Configuration

clc;
clear;

syms x1 x2 x3 f1 f2 f3
syms c1 c2 c3


%% algorithm

eq1 = c1 + c2*sin(x1)+c3*cos(x1) == f1;
eq2 = c1 + c2*sin(x2)+c3*cos(x2) == f2;
eq3 = c1 + c2*sin(x3)+c3*cos(x3) == f3;
sol = solve([eq1, eq2, eq3], [c1, c2, c3]);
c1 = sol.c1;
c2 = sol.c2;
c3 = sol.c3;

RHS = c1*(x3-x1)+c2*(cos(x1)-cos(x3)) + c3*(sin(x3)-sin(x1));

alpha1 = simplify(subs(RHS, {f1, f2, f3}, [1, 0, 0]));
alpha2 = simplify(subs(RHS, {f1, f2, f3}, [0, 1, 0]));
alpha3 = simplify(subs(RHS, {f1, f2, f3}, [0, 0, 1]));

approximation = alpha1 * f1 + alpha2 * f2 + alpha3 * f3;


%% calculate for f(x)
f = @(x)sin(0.9*x);
I_1 = double(subs(approximation, {x1,x2,x3,f1,f2,f3},[0,0.25,0.5,0,sin(0.225),sin(0.45)]));
I_2 = Simpson(f, 0, 0.5);
I = integral(f, 0, 0.5);

%% calculate for g(x)
g = @(x)x.^3;
J_1 = double(subs(approximation, {x1,x2,x3,f1,f2,f3},[0,0.5,1,0,0.5^3, 1]));
J_2 = Simpson(g, 0, 1);
J = integral(g, 0, 1);

%% calculate for h(x)
h = @(x)cos(x);
K_1 = double(subs(approximation, {x1,x2,x3,f1,f2,f3},[0,0.5,1,1,cos(0.5), cos(1)]));
K_2 = Simpson(h, 0, 1);
K = integral(h, 0, 1);




