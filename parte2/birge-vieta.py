# Implemente o algoritmo do método de birge-vieta e encontre uma raiz para a seguinte equação: 

# Métodos iterativos dependem do ...
# Para implementar o metodo de birge-vieta:
# - Definir a função f(x) continua no intervalo [a, b]
# - As derivadas primeira e segunda de f(x) devem ser continuas em [a, b]
# - Derivada primeira de f(x) não pode ser zero 
# O metodo vai descobrir uma raiz da f(x) aproximado

# Metodo de birge-vieta precisara de uma estimativa de valor inicial
# que seja proxima da raiz do problema e nao precisa de um intervalo

# Metodo iterativo especifico para caso polinomial


import math
def birge_vieta(a, n, x0, erro) -> float:

    k = 0
    b = [0] * n
    c = [0] * (n-1)
    R = 1

    # # Preencher fx
    # b.append(a[0])
    # for i in range(1, n):
    #     b.append(b[i-1] * x0 + a[i])

    # # Preencher f'x
    # c.append(b[0])
    # for i in range(1, n-1): # Faco uma vez a menos, pois aqui estou calculando a derivada
    #     c.append(c[i-1] * x0 + b[i])


    while(abs(R) > erro):
        k += 1  # Contador de chamadas
        
        # Preencher fx
        b[0] = a[0]
        for i in range(1, n):
            b[i] = (b[i-1] * x0 + a[i])

        # Preencher f'x
        c[0] = b[0]
        for i in range(1, n-1): # Faco uma vez a menos, pois aqui estou calculando a derivada
            c[i] = (c[i-1] * x0 + b[i])

        xk = x0 - (b[-1] / c[-1])
        x0 = xk
        R = b[-1]

        print("Iteração:", k, "Valor de x:", x0)
        print("b:", b)
        print("c:", c)


        

    return  k   # Retorna o valor de x e o número de chamadas

if __name__ == "__main__":
    # a = [1, 0, 2, -1]
    a = [3, -1, -1, 0, 1, 1]
    n_repeticoes = birge_vieta(a, len(a), 1, 1e-8)
    print("Número de repetições:", n_repeticoes)