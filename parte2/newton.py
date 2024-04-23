# Implemente o algoritmo do método de Newton e encontre uma raiz para a seguinte equação: 

# Métodos iterativos dependem do ...
# Para implementar o metodo de newton:
# - Definir a função f(x) continua no intervalo [a, b]
# - As derivadas primeira e segunda de f(x) devem ser continuas em [a, b]
# - Derivada primeira de f(x) não pode ser zero 
# O metodo vai descobrir uma raiz da f(x) aproximado

# Metodo de newton precisara de uma estimativa de valor inicial
# que seja proxima da raiz do problema e nao precisa de um intervalo

import math
def newton(x0, erro) -> float:

    k = 0
    fx = funcao(x0)
    while(abs(fx) > erro):
        k += 1  # Contador de chamadas

        xk = x0 - (funcao(x0) / derivada(x0))
        fx = funcao(xk)
        x0 = xk

        print("Iteração:", k, "Valor de x:", x0, "Valor de f(x):", fx)

    return  k   # Retorna o valor de x e o número de chamadas

def funcao(x):
    return math.exp(x) * math.sin(x) - 1

def derivada(x):
    return math.exp(x) * math.sin(x) + math.exp(x) * math.cos(x)

if __name__ == "__main__":
    n_repeticoes = newton(1, 1e-10)
    print("Número de repetições:", n_repeticoes)