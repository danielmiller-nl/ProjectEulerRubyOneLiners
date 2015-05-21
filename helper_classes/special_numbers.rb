PHI = (1+Math.sqrt(5))/2
Phi = (1-Math.sqrt(5))/2

def fib(n)  
    ((PHI**(n+1)-Phi**(n+1))/Math.sqrt(5)).round
end