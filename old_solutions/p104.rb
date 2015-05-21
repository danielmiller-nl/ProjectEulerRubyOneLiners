require './StringInteger.rb'

class String
	def last_9_pandigital?
		return false if self.length<9
		self[-9..-1].pandigital_1_to_9?
	end
	def first_9_pandigital?
		return false if self.length<9
		self[0..8].pandigital_1_to_9?
	end
	
end

a = "1"
b = "1"
count = 1

start = Time.now

until a.first_9_pandigital?
	temp = b
	b = a.int_add(b)
	a = temp
	count+=1
	puts "#{count} #{Time.now-start}" if count%1000==0
end

puts count
