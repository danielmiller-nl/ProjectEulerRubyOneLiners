require_relative 'array_extensions'

def sum_combos(sum,array)
	#puts "#{sum} #{array.inspect}"
	if  array.length==1&&sum%array[0]!=0
		0
	elsif sum==0||array.length==1
		1
	else
		array.upto(sum).sum {|element| sum_combos(sum-element,array.upto(element))}
	end
end

puts "Enter sum:"
sum = gets.chomp.to_i
puts "Enter numbers:"
array = gets.chomp.split(" ")
array.collect! {|n| n.to_i}
begin
puts "sum_combos(#{sum},#{array.inspect}) = #{sum_combos(sum,array)}"
puts "----"
puts "Enter sum:"
sum = gets.chomp.to_i
puts "Enter numbers:"
array = gets.chomp.split(" ")
array.collect! {|n| n.to_i}
end while sum!=0||Array.length!=0




=begin
sum_combos (sum, array)
	if array.length==1&&sum%array[0]!=0
		return 0
	else if sum==0||array.length==1
		return 1
	else
		return sum(sum_combos(sum-[each value of array <= sum],array.lessthanequalto_value_from_array))
		
sum_combos (2, [1,2,5,10])
	sum_combos (2-2,[1,2]) + sum_combos (2-1,[1])
			1		   + sum_combos (1-1,[1])
			1		   +			1
			
sum_combos (3, [1,2,5,10])
	sum_combos (3-2,[1,2]) + sum_combos (3-1,[1])
	sum_combos (1,[2,1]) + sum_combos (2,[1])
	sum_combos (1-1,[1]) + sum_combos (2-1,[1])
			1		 + sum_combos (1-1,[
			

sum_combos (8, [1,2,5,10])
	sum_combos (8-5,[1,2,5]) + sum_combos (8-2,[1,2]) + sum_combos (8-1,[1])
	sum_combos (3,[1,2,5])   + sum_combos (6,[1,2]) + 		1
	(sum_combos (3-2,[1,2]) + sum_combos (3-1,[1])) + (sum_combos (6-2,[2,1]) + sum_combos (6-1,[1])) + 1
	(sum_combos (1,[1,2]) + sum_combos (2,[1])) + (sum_combos (4,[2,1]) + sum_combos (5,[1])) + 1
	(sum_combos (0,[1]) + 1) + (sum_combos (2,[2,1]) + sum_combos (3,[1]) + 1) + 1
	(1 + 1) + (sum_combos (2-2,[2,1]) + sum_combos (2-1,[1])  + 1 + 1) + 1
	(1 + 1) + (sum_combos (0,[2,1]) + sum_combos (1,[1])  + 1 + 1) + 1

8
5,2,1
5,1,1,1
2,2,2,2
2,2,2,1,1
2,2,1,1,1,1
2,1,1,1,1,1,1
1,1,1,1,1,1,1,1

12-10=2
	2-2=0
	2-1=1
		1-1=0
12-5=7
	7-5=2
		2-2=0
		2-1=1
			1-1=0
	7-2=5
		5-2=3
			3-2=1
				1-1=0
			3-1=2
				2-1=1
					1-1=0
		5-1=4
			4-1=3
				3-1=2
					2-1=1
						1-1=0
	7-1=6
		6-1=5
			5-1=4
				4-1=3
					3-1=2
						2-1=1
							1-1=0
12-2=10
	10-2=8
		8-2=6
			6-2=4
				4-2=2
					2-2=0
					2-1=1
						1-1=0
				4-1=3
					3-1=2
						2-1=1
							1-1=0
			6-1=5
				5-1=4
					4-1=3
						3-1=2
							2-1=1
								1-1=0
=end
		
			
				

