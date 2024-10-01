% O metodo resolve o sistema Ax = b em duas etapas
% - Ly = b
% - Ux = y

% Na decomposicao LU de crout, nos calculamos coluna de L depois linha de U
% Na decomposicao LU de doolittle sera ao contrario,
% vamos calcular as linhas de U depois as colunas de L

% Outra diferenca eh que no metodo de crout a diagonal de U recebia 1,
% no metodo de doolittle a diagonal de L recebe 1

% Esse metodo eh otimizado pois utiliza menos memoria.
% A unica diferenca do metodo anterior, eh que utiliza
% a mesma matriz "a" para armazenar "L" e "U"

% clear
% clc

a = [4 2 3;2 -4 -1; -1 1 4];
b = [7 1 -5];
n = length(b);
ca = a;
for k=1:n
    for j=k:n
        soma = 0;
        for t=1:(k - 1)
            soma = soma + a(k,t) * a(t,j);        
        end
        a(k,j) = a(k,j) - soma;
    end
    for i=(k + 1):n
        soma = 0;
        for t=1:(k - 1)
            soma = soma + a(i,t) * a(t,k);
        end
        a(i,k) = (a(i,k) - soma) / a(k,k);
    end
end
% Substituicao direta Ly = b
y(1) = b(1);
for i=2:n
    soma = 0;
    for j=1:(i - 1)
        soma = soma + a(i,j) * y(j);
    end
    y(i) = (b(i) - soma);
end
y
% Retrosubstituicao Ux = y
x(n) = y(n) / a(n,n);
for i=(n - 1):-1:1
    soma = 0;
    for j=(i + 1):n
        soma = soma + a(i,j) * x(j);
    end
    x(i) = (y(i) - soma) / a(i,i);
end
x
% Residuo
% r = abs(b' - ca * x')