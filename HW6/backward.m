function[x]=backward(U,b)

S=size(U);
m=S(1);
if S(1)~=S(2)
    error('matrix mast be square')
end
x=zeros(1,m);
x(1,m)=b(end)./U(m,m);
%bacward substitution
for k=m-1:-1:1
    x1=1/U(k,k).*(b(k)-sum(U(k,k+1:end).*x(k+1:end)));
    x(k)=x1;
end
x=x';
end