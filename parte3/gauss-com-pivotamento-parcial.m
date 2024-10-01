% Metodo de Gauss com pivotamento parcial
% Nesse metodo serao efetuadas trocas de linhas, caso necessario

clear
clc

% a = [1 -1 1; 2 3 -1; -3 1 1];
% b = [1 4 -1];
a = [1 1 0 1; 2 1 -1 -1; -1 -2 3 -1; 3 -1 -1 2];
b = [2 1 4 -3];
n = length(b)

for k=1:(n - 1)
    % Verificar o maior elemento em modulo da coluna
    maior = abs(a(k,k));
    p = k; % Linha do pivo
    for i=(k + 1):n
        if (abs(a(i,k)) > maior)
            maior = abs(a(k,n));
            p = i; % Linha do novo pivo (O maior em modulo)
        end
    end

    % Trocar linha k por linha maior fisicamente
    if (p > k)
        for j=k:n
            temp(j) = a(k,j);
            a(k,j) = a(p,j);
            a(p,j) = temp(j);
        end
        temp = b(k);
        b(k) = b(p);
        b(p) = temp;
    end

    % Gauss, zerando elementos abaixo do pivo
    for i=(k + 1):n

        mult = a(i,k) / a(k,k);

        for j=k:n

            a(i,j) = a(i,j) - mult * a(k,j);

        end

        b(i) = b(i) - mult * b(k);

    end

end
a
b
ca = a; % Para calcular o residuo
cb = b; % Para calcular o residuo

% Retrosubstituicao

x(n) = b(n) / a(n,n);

for i=(n - 1):-1:1

  soma = 0;

  for j=(i + 1):n

    soma = soma + a(i,j)*x(j);

  end

  x(i) = (b(i) - soma) / a(i,i);

end

x

% Residuo -- Nao eh comum calcular o residuo em metodos diretos, como esse, pois
% eh feita a copia do sistema original em memoria

r = abs(cb' - ca * x') % x e b como vetor coluna apostrofo faz o transposto
