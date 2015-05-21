require_relative 'integer_extensions.rb'

def digit_sum_from_previous(previous_sum,number)
	ps = previous_sum
	
	mod = 10
	decrease = 0
	while number%mod==0
		decrease+=9
		mod*=10
	end
	ps-decrease+1
	
end

class Integer
	def digit_power_sum?
		sum = self.digit_sum
		return false if sum==1
		n = self
		while n!=1
			return false unless n%sum==0
			n/=sum
		end
		true
	end
	
	def digit_power_sum_B?(sum)
		return false if sum==1
		n = self
		while n!=1
			return false unless n%sum==0
			n/=sum
		end
		true
	end
end

n = 0
array = []
(2..200).each do |sum|
	(2..50).each do |power|
		n = sum**power
		array << n if n.digit_sum==sum	
	end 
end
puts array.sort[29]

=begin
n = 10
count = 0
start = Time.now
while count<12
	if n.digit_power_sum?
		puts "a#{count}: #{n} | #{Time.now-start}" 
		count+=1
	end
	n+=1
end
puts "-------"
n = 10
ps = 9
count = 0
sum = 0
start = Time.now
while count<12
	ps = digit_sum_from_previous(ps,n)
	if n.digit_power_sum_B?(ps)
		puts "a#{count}: #{n} | #{Time.now-start}" 
		count+=1
	end
	n+=1
end
=end
