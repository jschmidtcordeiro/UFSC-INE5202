

def gauss_sem_pivoteamento(a, b, n):
    # Recebe a dimensão da matriz
    # i = k + 1
    # j = k

    # Escalonamento da Matriz
    for k in range(1, n): # Varia de 1:n-1 
        
        for i in range(k+1, n+1): # Varia de k+1:n

            mult = a[i-1][k-1] / a[k-1][k-1]

            for j in range(k, n+1): # Varia de k:n
                # aij = aij - (aik / akk)*akj
                a[i-1][j-1] = a[i-1][j-1] - mult * a[k-1][j-1]

        # bi = bi - (aik / akk)*bkbirge_vieta
        b[i-1] = b[i-1] - mult * b[k-1]

    print(a)
    print(b)

    # Retrosubstituicao para resolver o sistema linear
    x = [0] * n
    x[n-1] = b[n-1] / a[n-1][n-1]


    for i in range(n, 0, -1):
        soma = 0

        for j in range(i+1, n):
            soma = soma + a[i-1][j-1] * x[j-1]

        x[i-1] = (b[i-1] - soma) / a[i-1][i-1]

    print(x)




if __name__ == "__main__":
    # Define a list of lists
    a = [
        [4, 2, 3],
        [2, -4, -1],
        [-1, 1, 4]
    ]
    b = [7, 1, -5]
    gauss_sem_pivoteamento(a, b, len(a))