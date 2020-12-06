clc;
clear

A = [1,-2,1;2,1,-3;4,-7,1];
b = [0,5,0]';

[L,U]= mylu(A);

y = forward(L,b);
x = backward(U,y);