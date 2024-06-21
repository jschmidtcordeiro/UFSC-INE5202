clear
format short

% Intervalo A B
a = 2;
b = 8;

% Numero de subintervalos. Quanto mais tiver, melhor sera a precisao do algoritmo
n = 8; % Numero de subintervalos precisa ser par
h = (b - a) / n;
x = [a:h:b];

% Funcao de Y
% y = x.^3;
% y = exp(x);
y = 5 * (x.^3) + (x.^-1);

m4 = 0;
m2 = 0;

for i = 1:n / 2
    m4 = m4 + y(2 * i);
end

for i = 1:n / 2 - 1;
    m2 = m2 + y(2 * i + 1);
end
x
y
S = (h / 3) * (y(1) + 4 * m4 + 2 * m2 + y(n + 1))

% Para calcular o erro, pode ser feito um loop para comparar a diferenca
% entre o calculo com dois n's diferentes
