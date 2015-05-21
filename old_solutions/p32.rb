class Array
	def permu(size)
		return self if self.length==1||size==1	
		perms = Array.new
		self.each {|element|(self-[element]).permu(size-1).each {|subelement| perms << ([element]+[subelement]).flatten}}
		perms
	end
	
	def join_ints(*joins)
		egroup_array = Array.new
		joins.each {|group_size| egroup_array << self.slice(egroup_array.subs_length,group_size)}	
		egroup_array.map {|group_array| group_array.join.to_i}
	end
	
	def subs_length
		self.inject(0) {|length,subs| length+subs.length}
	end
end

five_perms = [1,2,3,4,5,6,7,8,9].permu(5)

one_fours = five_perms.collect{|array| array.join_ints(1,4)}.collect{|array| [array[0],array[1],array[0]*array[1]]}
two_threes = five_perms.collect{|array| array.join_ints(2,3)}.collect{|array| [array[0],array[1],array[0]*array[1]]}

valid_products = Array.new

one_fours.each  {|array| valid_products << array[2] if array[2]<10000&&!array.join.include?("0")&&array.join.scan(/\d/).uniq.length==9}
two_threes.each  {|array| valid_products << array[2] if array[2]<10000&&!array.join.include?("0")&&array.join.scan(/\d/).uniq.length==9}

puts valid_products.uniq.inject(:+)





	
