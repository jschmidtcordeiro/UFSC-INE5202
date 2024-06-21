clear
format short

% Intervalo A B
a = 2;
b = 8;

% Numero de subintervalos. Quanto mais tiver, melhor sera a precisao do algoritmo
n = 8;
h = (b - a) / n;
x = [a:h:b];

% Funcao de Y
% y = x.^3;
% y = exp(x);
y = 5 * (x.^3) + (x.^-1);

soma = 0;

for i = 2:n
    soma = soma + y(i);
end

x
y
T = (h / 2) * (y(1) + 2 * soma + y(n + 1))

% Para calcular o erro, pode ser feito um loop para comparar a diferenca
% entre o calculo com dois n's diferentes
