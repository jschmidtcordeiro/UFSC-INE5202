% clear
% clc
format long
% a=[3 -1 -2;1 -4 1;-2 1 -3];
% b=[2 4 -7];

% a = [5 2 1; -1 4 2; 2 -3 10];
% b = [7 3 -1];

a = [3 -1 -2; 1 -4 1; -2 1 -3];
b = [2 4 -7]

n=length(b);
x0=zeros(1,n); % Estimativa inicial
xa=x0;
erro=10^-6;
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
    x0(i)=(b(i)-soma)/a(i,i);
  endfor
  d=max(abs(x0-xa)); % Criterio de parada
  xa=x0;
end
k
x0
d