#cython: language_level=3
cimport cython
cimport numpy as cnp
import numpy as cnp
#from math import exp
from libc.math cimport exp as c_exp


def c_rbf_network(cnp.ndarray[cnp.float_t, ndim=2] X, cnp.ndarray[cnp.float_t, ndim=1] beta, double theta):
#def c_rbf_network(double[:,:] X, double[:] beta, double theta):

   cdef int N = X.shape[0]
   cdef int D = X.shape[1]
   cdef cnp.ndarray Y = cnp.zeros(N)
   cdef int i
   cdef int j 
   cdef double r 
   cdef int d		
	
	
   for i in range(N):
        for j in range(N):
            r = 0
            for d in range(D):
                r += (X[j, d] - X[i, d]) ** 2
            r = r**0.5
            Y[i] += beta[j] * c_exp(-(r * theta)**2)

   return Y
    
