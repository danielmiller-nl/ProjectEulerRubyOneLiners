require 'prime'

def div_by(x,y)
	x%y==0
end

def primes_upto(n)
	pnu = Prime.take_while {|p| p<n}
	pnu
end

def prime_factors(n)
	prime_factors = Array.new
	test_factor = 2
	until n == 1 do
		while div_by(n,test_factor) do
			n/=test_factor
			prime_factors << test_factor
		end
		if(test_factor==2)
			test_factor=3
		else 
			test_factor+=2
		end
	end
	prime_factors
end

def smallest_cm_1toN(n)
	to_multiply = Array.new
	primes_lessthan_n = primes_upto(n)
	
	primes_lessthan_n.reverse.each { |i|
		break if i<n/2
		to_multiply << i
	}
	
	primes_lessthan_n.each { |i|
		break if i>=n/2
		j = i
		while j<=n do
			j*=i
		end
		j/=i
		to_multiply << j
	}
	to_multiply.inject(:*)
end

p smallest_cm_1toN(10)
p smallest_cm_1toN(20)


