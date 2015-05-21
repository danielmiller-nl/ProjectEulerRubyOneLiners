require './extensions/array_extensions.rb'

puts (1..100).to_a.sum.square - (1..100).to_a.map{|n| n.square}.sum