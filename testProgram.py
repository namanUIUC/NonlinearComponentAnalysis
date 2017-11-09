import numpy as np
import matplotlib.pyplot as plt

#XOR
X, Y = [], []
for i in range(100):

    x1, x2 = np.random.uniform(0,1,size=2)

    if x1 >.5 and x2 > .5: y=1
    elif x1 < .5 and x2 < .5: y=1
    else: y=0

    X.append([x1,x2])
    Y.append(y)

#Radial
X, Y = [], []
for i in range(100):

    x1, x2 = np.random.uniform(-1,1,size=2)

    if np.linalg.norm(np.array([x1,x2])) < 0.5: y=1
    else: y=0

    X.append([x1,x2])
    Y.append(y)

plt.scatter([X[i][0] for i in range(100) if Y[i]==1],
            [X[i][1] for i in range(100) if Y[i]==1],
            color='blue')

plt.scatter([X[i][0] for i in range(100) if Y[i]==0],
            [X[i][1] for i in range(100) if Y[i]==0],
            color='red')
plt.show()

X = np.array(X).T

U, s, V = np.linalg.svd(X, full_matrices=True)
S = np.diag(s)
S_inv = np.diag(1/s)

X_pca = X.T.dot(X).dot(V[:2].T).dot(S_inv)

K = np.zeros((100,100))

for i in range(100):
    for j in range(100):
        if j > i: continue
        #K[i,j] = (X.T[i].dot(X.T[j]) + 1)**2 #Polynomial Kernel
        K[i,j] = np.exp(0.7*np.linalg.norm(X.T[i]-X.T[j])**2) #RBF Kernel
        K[j,i] = K[i,j]

for i in range(98):

    if np.random.uniform(0,1) > 0.1: continue

    X_kpca = K.dot(V[i:(i+2)].T).dot(S_inv)

    plt.scatter([X_kpca[i][0] for i in range(100) if Y[i]==1],
                [X_kpca[i][1] for i in range(100) if Y[i]==1],
                color='blue')

    plt.scatter([X_kpca[i][0] for i in range(100) if Y[i]==0],
                [X_kpca[i][1] for i in range(100) if Y[i]==0],
                color='red')
    plt.show()
