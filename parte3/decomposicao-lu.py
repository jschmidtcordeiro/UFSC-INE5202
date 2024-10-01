
# As linhas e colunas serao representadas com os valores
# de 0 ate n. Entao em um exemplo de matriz 3x3, suas linhas
# e colunas serao representadas de 0 ate 2

def decomposicao_lu(a, b, n):
    L = [[0 for i in range(n)] for j in range(n)]
    U = [[0 for i in range(n)] for j in range(n)]

    # Comecar o loop no K
    for k in range(0, n):
        
        # Variacao na linha, coluna fixa em K
        for i in range(k, n):
            soma = 0
            for t in range(0, k):
                soma += L[i][t] * U[t][k]

            L[i][k] = a[i][k] - soma

        U[k][k] = 1
        # Variacao na coluna, linha fixa em K
        for j in range(k+1, n):
            soma = 0
            for t in range(0, k):
                soma += L[k][t] * U[t][j]
            
            U[k][j] = (a[k][j] - soma) / L[k][k]

    # Print a beautiful matrix, with everything allinged
    print("L")
    for i in range(n):
        print(L[i])
    print("U")
    for i in range(n):
        print(U[i])

    ### Essa parte ainda esta errada! ###

    y = [0] * n

    y[1] = b[1] / L[1][1]
    for i in range(1, n):
        soma = 0
        for j in range(0, i):
            soma += L[i][j] * y[j]
        
        y[i] = (b[i] - soma) / L[i][i]

    print("Y")
    print(y)
    
    ###

if __name__ == "__main__":
    # Define a list of lists
    a = [
        [4, 2, 3],
        [2, -4, -1],
        [-1, 1, 4]
    ]
    b = [7, 1, -5]
    decomposicao_lu(a, b, len(a))