require_relative 'integer_extensions.rb'

def f(n)
	phi = (1.0+Math.sqrt(5))/2.0
	p = phi
	i = 1
	while i<n
		p*=phi
		p/=10.0 if p>=1000000000000
		i+=1
	end
	(p/Math.sqrt(5)).floor
end

def first_9_pandigital?(n)
	return false if n.digits<9
	n2 = n
	while n2.digits>9
		n2/=10
	end
	n2.pandigital_one_to_nine?
end

f1 = 1
f2 = 1
n = 2
until f2.pandigital_one_to_nine?&&first_9_pandigital?(f(n))
	temp = f2
	f2+=f1
	f2 = f2%1000000000
	f1 = temp
	n+=1
end
puts n

