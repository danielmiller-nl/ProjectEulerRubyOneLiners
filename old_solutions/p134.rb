require_relative 'integer_extensions'

def lastA_divB(a,b)
	number = a
	increase = 10**a.digits
	while number%b!=0
		number += increase
	end
	number
end

def lastB_divA(b,a)
	if (a*b)%(10**b.digits)==b
		return a*b
	end

	mod = (10**b.digits)%a
	
	quotients = []
	remainders = []
	
	q = a/mod
	r = a%mod
	quotients << q
	remainders << r
	
	q = mod/remainders[0]
	r = mod%remainders[0]
	quotients << q
	remainders << r
	
	while r!=0
		q = remainders[-2]/remainders[-1]
		r = remainders[-2]%remainders[-1]
		quotients << q
		remainders << r
	end
		
	quotients = [1,1]+quotients
	remainders = [a,mod]+remainders

	expanded = [[],[],[]]
	i = 2
	while i<remainders.length-1
		expanded[0][i-2] = remainders[i]
		expanded[1][i-2] = [remainders[i-2],-1*quotients[i],remainders[i-1]]
		expanded[2][i-2] = i == 2 ? expanded[1][0][1] : i == 3 ? 1 + expanded[1][1][1]*expanded[2][0] : expanded[2][i-4]+expanded[1][i-2][1]*expanded[2][i-3]
		i+=1
	end
	(10**b.digits)*(((expanded[2].last+a)*(a-b))%a)+b
end

primes_to_search = (1000000.primes_below - [2,3]) << 1000000.next_prime
i = 0
j = 1
sum = 0
while primes_to_search[i]<=1000000
	pi = primes_to_search[i]
	pj = primes_to_search[j]
	#puts "(#{pi},#{pj}) #{lastA_divB(pi,pj)} #{lastB_divA(pi,pj)} #{lastA_divB(pi,pj)==lastB_divA(pi,pj)}"
	sum += lastB_divA(primes_to_search[i],primes_to_search[j])
	i = j
	j += 1
end
puts "sum: #{sum}"

