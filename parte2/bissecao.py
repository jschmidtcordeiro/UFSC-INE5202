# Implemente o algoritmo do método da Bisseção e encontre uma raiz para a seguinte equação: 

# f(x) = ex – 2math.sin(x) no intervalo inicial [0 ; 2]
import math
def bissecao(a, b, erro, fxm) -> float:
    # a = 0
    # b = 1
    # erro = 1e-10
    # fxm = 1 ## Criterio de parada

    fa=math.exp(a) * math.sin(a) - 1
    fb=math.exp(b) * math.sin(b) - 1 

    k = 0
    while(abs(fxm) > erro):
        k += 1  # Contador de chamadas
        xm = (a + b) / 2  # Ponto médio
        fxm=math.exp(xm) * math.sin(xm) - 1 # Função f(xm)
        if (fa * fxm < 0):  # Troca de intervalo
            b = xm  # Novo intervalo
        else:   
            a = xm  # Novo intervalo
            fa = fxm    # Novo valor de f(a)

    #     print("A:", a)
    #     print("B:", b)
    #     print("Xm:", xm)
    #     print("Fxm:", fxm)
    #     print("\n")

    # print("Numero de chamadas:", k)
    return xm   # Retorna o valor de x

if __name__ == "__main__":
    print("Raiz:" ,bissecao(0, 1, 1e-10, 1))