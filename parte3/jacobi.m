% clear
% clc
a=[3 -1 -1;1 3 1;2 -2 4];
b=[1 5 4];
n=length(b);
x0=zeros(1,n);
erro=10^-7;
d=1;
k=0;
while (d>erro)
  k=k+1;
  for i=1:n
    soma=0;
    for j=1:n
      if j~=i
        soma=soma+a(i,j)*x0(j);
      endif
    endfor
    x(i)=(b(i)-soma)/a(i,i);
  endfor
  d=max(abs(x-x0));
  x0=x;
end
k
x0
d