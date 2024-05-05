clear
clc

a = [4 2 3; 2 -4 -1; -1 1 4];
b = [7 1 -5];
n = length(b)

for k=1:(n - 1)

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
ca = a
cb = b

% Retrosubstituicao

x(n) = b(n) / a(n,n);

for i=(n - 1):-1:1

  soma = 0;

  for j=(i + 1):n

    soma = soma + x(j)*a(i,j);

  end

  x(i) = (b(i) - soma) / a(i,i);

end

x

% Residuo -- Nao eh comum calcular o residuo em metodos diretos, como esse, pois
% eh feita a copia do sistema original em memoria

r = abs(cb' - ca * x') % x e b como vetor coluna apostrofo faz o transposto
