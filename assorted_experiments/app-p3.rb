class Integer
	def div_by(x)
		self%x==0
	end
end


def prime_factors(n)
	prime_factors = Array.new
	test_factor = 2
	until n == 1 do
		prime_factors << test_factor if n.div_by(test_factor)
		while n.div_by(test_factor) do
			n/=test_factor
		end
		test_factor+=1
	end
	prime_factors
end

puts "This app will tell you the prime factors of a number"
puts "Enter a number or 'q' to quit:"
n = gets.chomp
while n!='q' do
	n = n.to_i
	puts "The prime factors of #{n} are:"
	p prime_factors(n)
	puts "Enter another number or 'q' to quit:"
	n = gets.chomp
end 
puts "goodbye!"
