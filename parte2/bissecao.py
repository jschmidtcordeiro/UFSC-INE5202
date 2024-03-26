# Implemente o algoritmo do método da Bisseção e encontre uma raiz para a seguinte equação: 

# f(x) = ex – 2math.sin(x) no intervalo inicial [0 ; 2]
import math

a = 0
b = 1
erro = 1e-10
fxm = 1


fa=math.exp(a) * math.sin(a) - 1
fb=math.exp(b) * math.sin(b) - 1

k = 0
while(abs(fxm) > erro):
    k += 1
    xm = (a + b) / 2
    fxm=math.exp(xm) * math.sin(xm) - 1
    if (fa * fxm < 0):
        b = xm
    else:
        a = xm
        fa = fxm

    print("A:", a)
    print("B:", b)
    print("Xm:", xm)
    print("Fxm:", fxm)
    print("\n")

print("Numero de chamadas:", k)