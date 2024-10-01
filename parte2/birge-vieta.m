%birge vieta
% clc;
% clear;
format long;
function y = birgeVieta(a, x0, erro) % faz menos calculos (nao precisa avaliar funcao) substituicao metodo de newton

  n=length(a);
  k=0;
  b(1)=a(1); %b1 = c1 = a1
  c(1)=b(1);
  b(n)=1; %ultimo b = valor qualquer > erro
  %ultimo b = R = resto divisao ponto x
  %ultimo c = R' = resto derivada ponto x
  while abs(b(n)) > erro
    k=k+1;
    for i=2:n-1
      b(i) = b(i-1)*x0+a(i); %fazendo os dois ao mesmo tempo
      c(i) = c(i-1)*x0+b(i);
    end
     b(n) = b(n-1)*x0+a(n); % calcula o ultimo pq o for nao vai ate o ultimo por causa do c
     x0=x0-b(n)/c(n-1);
     b
     c
     x0
     pause
  end
  k
  x0
  b(n)
end
birgeVieta([3 -1 -1 0 1 1], 1, 10^-8);

