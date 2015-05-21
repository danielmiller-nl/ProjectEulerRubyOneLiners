require_relative 'integer_extensions.rb'
require_relative 'array_extensions.rb'

n = 1
sum = 0
y = []
max = 10**8
while n**2+(n+1)**2<max
	cn = n+1
	sum = n**2+(n+1)**2
	while sum<max
		y << sum if sum.palindrome? 
		cn+=1
		sum+=cn**2
	end
	n+=1
end
puts y.uniq.sum
