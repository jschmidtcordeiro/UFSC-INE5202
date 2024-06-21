% Interpolacao de Lagrange

% Se eu quero um polinomio de grau 2, eu preciso de
% no minimo 3 pontos.

% A diferenca principal ao ser comparado com o sistema
% linear eh que nao sera obtida a equacao do polinomio.
% Desse modo, sempre que for necessario calcular um novo
% ponto, todo o calculo sera refeito.

function interpolacao_lagrange
    clear
    format short

    % x = [-1 0 1];
    % y = [4; 1; -1];

    x=[0.1 0.3 0.5 0.7];
    y=[0.101 0.327 0.625 1.043];

    n = length(x);

    % Ponto
    % xx = 0.5;
    xx = 0.4;
    
    px = Lag(x, y, n, xx)

    % % Grafico
    % % h = (max(x) - min(x) / 10);
    % % x1 = [min(x):h:max(x)];
    % % n1 = length(x1);
    % %------
    % xx = 0.5;
    % px = Lag(x, y, n, xx);
    % for i=1:n1
    %     p1(i) = Lag(x, y, n, x1(i));
    % end
    % % plot(x,y,'*');
    % % grid
    % % hold on
    % % Plot(x1, p1)

end % End function interpolacao_lagrange

function p = Lag(x, y, n, xx)
    p = 0;

    for i = 1:n
        num = 1;
        den = 1;

        for j = 1:n

            if j ~= i
                num = num * (xx - x(j));
                den = den * (x(i) - x(j));
            end

        end

        L = num / den
        p = p + y(i) * L;
    end

end % End function Lag
