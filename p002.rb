require './helper_classes/special_numbers.rb'
require './extensions/array_extensions.rb'

puts (2..32).step(3).to_a.map{|n| fib(n)}.sum