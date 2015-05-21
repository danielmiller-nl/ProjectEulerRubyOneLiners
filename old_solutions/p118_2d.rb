require './integer_extensions.rb'
require './array_extensions.rb'

p100 = 100.primes_below - [11]
p100_1d = p100[0..3]
p100_2d = p100.drop(4)

prime_pandig_sets = []

p100_2d_4set = p100_2d.permutation(4).to_a
p100_2d_3set = p100_2d.permutation(3).to_a

p100_1d_3set = p100_1d.permutation(3).to_a

p100_2d_4set.each do |a|
	p100_1d.each do |d|
		pan = a+[d]
		#puts "#{pan.inspect} #{pan.dig_array_to_int} #{pan.dig_array_to_int.pandigital_one_to_nine?}"
		prime_pandig_sets << pan.sort if pan.to_i.pandigital_one_to_nine?
	end
end

p100_2d_3set.each do |a|
	p100_1d_3set.each do |d|
		pan = a+d
		prime_pandig_sets << pan.sort if pan.dig_array_to_int.pandigital_one_to_nine?
	end
end

puts prime_pandig_sets.uniq.inspect
puts "---"
puts prime_pandig_sets.uniq.length
