% Metodo de Gauss com pivotamento completo
% Nesse metodo serao efetuadas trocas de linhas, caso necessario

% clear
% clc
format short

% a = [1 -1 1; 2 3 -1; -3 1 1];
% b = [1 4 -1];
a = [1 1 0 1; 2 1 -1 -1; -1 -2 3 -1; 3 -1 -1 2];
b = [2 1 4 -3];
n = length(b)
o = [1 2 3 4]

for k=1:(n - 1)
    % Verificar o maior elemento em modulo da coluna
    maior = abs(a(o(k),k));
    p = k; % Linha do pivo
    for i=(k + 1):n
        if (abs(a(o(i),k)) > maior)
            maior = abs(a(o(i),n));
            p = i; % Linha do novo pivo (O maior em modulo)
        end
    end

    % Trocar linha k por linha maior no vetor o
    if (p > k)
        temp = o(k);
        o(k) = o(p);
        o(p) = temp;
    end


    % Gauss, zerando elementos abaixo do pivo
    % Triangularizacao
    for i=(k + 1):n

        mult = a(o(i),k) / a(o(k),k);

        for j=k:n

            a(o(i),j) = a(o(i),j) - mult * a(o(k),j);

        end

        b(o(i)) = b(o(i)) - mult * b(o(k));

    end

end
a
b
ca = a; % Para calcular o residuo
cb = b; % Para calcular o residuo
o % Vetor de ordenamento das trocas de linhas

% Retrosubstituicao

x(n) = b(o(n)) / a(o(n),n);

for i=(n - 1):-1:1

  soma = 0;

  for j=(i + 1):n

    soma = soma + x(j)*a(o(i),j);

  end

  x(i) = (b(o(i)) - soma) / a(o(i),i);

end

x

% Residuo -- Nao eh comum calcular o residuo em metodos diretos, como esse, pois
% eh feita a copia do sistema original em memoria

r = abs(cb' - ca * x') % x e b como vetor coluna apostrofo faz o transposto
