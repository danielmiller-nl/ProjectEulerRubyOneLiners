require 'prime'

=begin
digits = [1,2,3,4,5,6,7]
largest_ndpdp = 0
n_permutations = digits.permutation(digits.length).to_a
n_permutations.each { |permutation| largest_ndpdp = permutation.join.to_i if permutation.join.to_i.prime?  }
puts largest_ndpdp
=end

puts [*1..7].reverse.permutation(7).find { |p| Prime.prime?(p.join.to_i) }.join

