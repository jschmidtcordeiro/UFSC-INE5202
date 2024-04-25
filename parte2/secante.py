# Implemente o algoritmo do método de secante e encontre uma raiz para a seguinte equação: 

# Métodos iterativos dependem do ...
# Para implementar o metodo de secante:
# - Definir a função f(x) continua no intervalo [a, b]
# - As derivadas primeira e segunda de f(x) devem ser continuas em [a, b]
# - Derivada primeira de f(x) não pode ser zero 
# O metodo vai descobrir uma raiz da f(x) aproximado

# Metodo de secante precisara de duas estimativas de valor inicial

import math
def secante(x1, x0, erro) -> float:

    k = 0
    fx1 = funcao(x1)
    fx0 = funcao(x0)
    while(abs(fx1) > erro):
        k += 1  # Contador de chamadas


        x2 = x1 - (((x1 - x0) * fx1) / (fx1 - fx0))

        x0 = x1
        x1 = x2

        fx0 = funcao(x0)
        fx1 = funcao(x1)

        print("Iteração:", k, "Valor de x:", x1, "Valor de f(x):", fx1)


    return  k   # Retorna o valor de x e o número de chamadas

def funcao(x):
    return math.exp(x) * math.sin(x) - 1

if __name__ == "__main__":
    n_repeticoes = secante(1, 0, 1e-10)
    print("Número de repetições:", n_repeticoes)