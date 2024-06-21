function rungekutta2
    clear
    format long
    a = 0;
    b = 0.5;
    h = 0.1; % Quanto menor o h, maior a precisao pois serao gerados mais pontos
    x = [a:h:b];
    n = length(x);

    y(1) = -1; % PVI

    for i = 1:(n - 1)
        k1 = h * fxy(x(i), y(i));
        k2 = h * fxy(x(i) + h, y(i) + k1);
        y(i + 1) = y(i) + (k1 + k2) / 2;
    end

    y

    % Solucao exata
    ye = -3 * exp(-x) - 2 * x + 2

    % Desvio / Erro
    d = abs(y - ye)
end

function f = fxy(x, y)
    f = -2 * x - y;
end
