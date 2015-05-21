require_relative 'integer_extensions.rb'
require_relative 'array_extensions.rb'
require_relative 'fraction.rb'
class Integer
	def coprimes_between_13_12(prime_list)
		prime_factors = self.prime_factors(prime_list)
		coprimes = []
		third = (self.to_f/3).ceil
		half = self/2
		array = *(third..half)
		prime_factors.each do |pf|
			tmpf = third%pf
			start = tmpf==0 ? 0 : pf-tmpf
			array.iterate_index(start,pf) {|n| array[n]=0}
		end
		array.each {|n| coprimes << n if n!=0}
		coprimes
	end
end

start = Time.now
primes = 12000.primes_below
pfs = []
count = 0
(1..12000).each do |n|
	count+=n.coprimes_between_13_12(primes).size
end
puts count-2
puts "#{Time.now-start}"






