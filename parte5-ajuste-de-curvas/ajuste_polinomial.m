% Algoritmo de ajuste de curvas
% clear
% clc
format long

x = [1.3 3.4 5.1 6.8 8];
y = [2 5.2 3.8 6.1 5.8];
n = length(x)% Numero de pontos
M = 2; % Grau do ajuste -- Nesse caso indica que eh um sistema linear. Se fosse 2, seria uma parabola

for i = 1:M + 1% Varia as linhas da Matriz

    for j = 1:M + 1% Varia as colunas da Matriz

        a(i, j) = 0;

        for k = 1:n% Somatorio no numero de pontos
            a(i, j) = a(i, j) + x(k)^(j + i - 2);
        end

    end

    b(i) = 0;

    for k = 1:n% Somatorio de cada elemento para a Matriz de coeficientes
        b(i) = b(i) + y(k) * x(k)^(i - 1);
    end

end

a
b
D = det(a)% Determinante
% Numero de condicao da matriz. Quanto maior o numero de condicao, pior.
% Por isso nao se deve utilizar polinomios acima de grau 2.
NC = cond(a)
c = a \ b'% Resolve o sistema linear. Eliminacao Gaussiana

% Para plotar o grafico
for i = 1:n
    g(i) = 0;

    % Somatorio de c(i)*x(k)^(i-1)
    for j = 1:M + 1
        g(i) = g(i) + c(j) * x(i)^(j - 1);
    end

end

g % Curva de ajuste

%plot(x, y, "*")
%hold on
%grid
%plot(x,g)
