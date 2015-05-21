require 'active_support/core_ext/integer/inflections'

def sums_mults_below(array,lim)
	(1..(lim-1)).inject(0) {|sum,multiple| (array.any? {|j| multiple%j==0}) ? sum + multiple : sum}
end

puts "This app tells you the sum of all the multiples of the numbers you provide up to a given limit."
begin
puts "Enter the numbers separated by spaces:"
nums = gets.chomp.split(" ").map {|i| i.to_i}
puts "What is the limit below which you will sum?"
limit = gets.chomp.to_i
puts "The sum of all the multiples of #{nums} below #{limit} is: #{sums_mults_below(nums,limit)}. \n"
puts "Would you like to find another sum of multiples? \nEnter 'yes' to continue, anything else to quit."
continue = gets.chomp
end while continue.downcase=="yes"
puts "goodbye!"

