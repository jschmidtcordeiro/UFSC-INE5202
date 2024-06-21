% Interpolacao polinomial
function interpolacao
    format short
    % a = [1 -1 1;1 0 0;1 1 1];

    % x = [-1 0 1];
    % y = [4; 1; -1];

    % x = [2:0.05:2.15];
    % y = log(x);

    x = [0.1 0.3 0.5 0.7];
    y = [0.011 0.117 0.375 0.833];

    n = length(x);
    grau = n - 1;

    % Montar matriz de coeficientes
    for i = 1:n

        for j = 1:n
            V(i, j) = x(i)^(j - 1);
        end

    end
    V

    a = V \ y'

    % Avalia um ponto de interpolacao
    xx = 0.6; % Ponto que sera interpolado
    % xx = 2.14;

    px = avalia(xx, n, a)

    % Quanto mais pontos melhor sera a interpolacao entre eles
    x1 = [x(1):0.2:x(n)];
    n1 = length(x1); % Numero de pontos para interpolar

    for j = 1:n1
        p(j) = avalia(x1(j), n, a);
    end

    p

    % plot(x, y, '*')
    % grid
    % hold on
    % plot(x1, p, 'r')
    % hold on
    % plot(xx, px, 'go')
end

% Avalia um ponto de interpolacao
function p = avalia(xx, n, a)

    p = 0;

    for i = 1:n
        p = p + a(i) * xx^(i - 1);
    end

end
