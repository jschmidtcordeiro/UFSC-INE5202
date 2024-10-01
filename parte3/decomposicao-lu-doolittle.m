% O metodo resolve o sistema Ax = b em duas etapas
% - Ly = b
% - Ux = y

% Na decomposicao LU de crout, nos calculamos coluna de L depois linha de U
% Na decomposicao LU de doolittle sera ao contrario,
% vamos calcular as linhas de U depois as colunas de L

% Outra diferenca eh que no metodo de crout a diagonal de U recebia 1,
% no metodo de doolittle a diagonal de L recebe 1


% clear
% clc

% a = [4 2 3;2 -4 -1; -1 1 4];
% b = [7 1 -5];

a = [2 3 4; 1 1 1; 4 -1 -2];
b = [20 6 -4];
n = length(b);
for k=1:n
    for j=k:n
        soma = 0;
        for t=1:(k - 1)
            soma = soma + L(k,t) * U(t,j);        
        end
        U(k,j) = a(k,j) - soma;
    end
    L(k,k) = 1; % Diagonal de L eh 1
    for i=(k + 1):n
        soma = 0;
        for t=1:(k - 1)
            soma = soma + L(i,t) * U(t,k);
        end
        L(i,k) = (a(i,k) - soma) / U(k,k);
    end
end
L
U
% Substituicao direta Ly = b
y(1) = b(1);

for i=2:n
    soma = 0;
    for j=1:(i - 1)
        soma = soma + L(i,j) * y(j);
    end
    y(i) = (b(i) - soma);
end
y
% Retrosubstituicao Ux = y
x(n) = y(n) / U(n,n);
for i=(n - 1):-1:1
    soma = 0;
    for j=(i + 1):n
        soma = soma + U(i,j) * x(j);
    end
    x(i) = (y(i) - soma) / U(i,i);
end
x
% Residuo
% r = abs(b' - a * x')