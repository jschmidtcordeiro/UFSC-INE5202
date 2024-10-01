# Parte 4 - Rasolucao de sistemas Nao Lineares
# Qualquer tipo de equacao pode formar o sistema

# Cada equacao do sistema, sera uma funcao das incognitas da equacao.
# Uma condicao para utilizar, eh igualar as funcoes a zero no ponto x

import math
import numpy as np

def newton(x, erro) -> float:
    n = len(x)

    k = 0
    # Matriz n por n vazia
    J = [[0] * n for _ in range(n)]
    F = [0] * n
    d_abs = 1

    # Pode-se utilizar o somatorio de d ou o somatorio de F para criterio de parada
    while(d_abs > erro):
        k += 1  # Contador de chamadas

        # Calcular F
        F[0] = funcao1(x)
        F[1] = funcao2(x)

        # Montar a matriz Jacobiana
        J[0][0] = math.exp(x[0])
        J[0][1] = 1
        J[1][0] = 2 * x[0]
        J[1][1] = 2 * x[1]

        # Calcular vetor d pelo metodo direto Ad = B
        A = np.array(J)
        B = np.array(F)
        d = np.linalg.solve(A, B)
        d_abs = np.linalg.norm(d).tolist()

        print("d:", d)
        print("d_abs:", d_abs)
        x = x + d

    return  k   # Retorna o valor de x e o número de chamadas

def funcao1(x):
    return math.exp(x[0]) + x[1]

def funcao2(x):
    return x[0]**2 + x[1]**2 

if __name__ == "__main__":
    n_repeticoes = newton([1, -1], 1e-10)
    print("Número de repetições:", n_repeticoes)