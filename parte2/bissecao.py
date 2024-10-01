# Implemente o algoritmo do método da Bisseção e encontre uma raiz para a seguinte equação: 

# f(x) = ex – 2math.sin(x) no intervalo inicial [0 ; 2]
import math
def bissecao(a, b, erro, fxm) -> float:
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

    return k   # Retorna o valor de x e o número de chamadas

if __name__ == "__main__":
    n_repeticoes = bissecao(0, 1, 1e-10, 1)
    print("Número de repetições:", n_repeticoes)
    # print("Raiz:", raiz)