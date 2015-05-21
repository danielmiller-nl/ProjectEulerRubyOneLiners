require './extensions/integer_extensions.rb'

puts 20.primes_below.map{|x| x.greatest_pow_below 20}.uniq.product

