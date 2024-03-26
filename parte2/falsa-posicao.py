# Implemente o algoritmo do método da Falsa Posição e encontre uma raiz para a seguinte equação: 

# Métodos de partição dependem do intervalo a b

# f(x) = ex – 2cos(x) no intervalo inicial [0 ; 2]
import math
def falsa_posicao(a, b, erro, fxk) -> float:
    fa=math.exp(a) * math.sin(a) - 1
    fb=math.exp(b) * math.sin(b) - 1 

    k = 0
    while(abs(fxk) > erro):
        k += 1  # Contador de chamadas

        ## Formula da Falsa Posição 
        # xk = a - (fa * (b - a) / (fb - fa))
        divisor = (fa *(b - a))
        dividendo = (fb - fa)
        xk = a - (divisor / dividendo)
        
        fxk=math.exp(xk) * math.sin(xk) - 1 # Função f(xk)

        if (fa * fxk < 0):  # Troca de intervalo
            b = xk  # Novo intervalo
            fb = fxk
        else:   
            a = xk  # Novo intervalo
            fa = fxk    # Novo valor de f(a)

    return xk, k   # Retorna o valor de x e o número de chamadas

if __name__ == "__main__":
    raiz, n_repeticoes = falsa_posicao(0, 1, 1e-10, 1)
    print("Número de repetições:", n_repeticoes)
    print("Raiz:", raiz)