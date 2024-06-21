% Algoritmo de ajuste de curvas
clear
format short
% clc

% x = [0.2:0.1:0.8];
% y = [3.16 2.38 1.75 1.34 1 0.74 0.56];

% x = [1 3 4 6];
% y = [2.5 13 22 36];

% x = [3.4 10.8 28.8 54 71];
% y = [19 17 13 8.9 6.9];

x = [1.2 1.4 1.6 1.8 2];
y = [4.2 6.1 8.5 11.5 14.1];

z = log(y); % Ln(y)
n = length(x);
% Grau do ajuste -- Nesse caso indica que eh um sistema linear
% Sera sempre 1 pois o problema foi linearizado e sera sempre exponencial
M = 1; 

for i = 1:M + 1

    for j = 1:M + 1

        a(i, j) = 0;

        for k = 1:n
            a(i, j) = a(i, j) + x(k)^(j + i - 2);
        end

    end

    b(i) = 0;

    for k = 1:n
        % Ao inves de utilizar o Y, utilizamos o Z (Quando comparado com o ajuste polinomial)
        b(i) = b(i) + z(k) * x(k)^(i - 1);
    end

end

a
b
D = det(a)
NC = cond(a)
c = a \ b'; % Resolve o sistema linear
% c(1) = exp(c(1));
c = exp(c)

% Para plotar o grafico
for k = 1:n
    g(k) = c(1) * exp(c(2) * x(k));
end

%plot(x, y, "*")
%hold on
%grid
%plot(x,g)
