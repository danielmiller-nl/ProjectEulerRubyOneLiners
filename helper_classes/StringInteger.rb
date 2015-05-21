class String

	def int_add(int_string)
		x, y = longer_shorter(self, int_string)
		i = 1
		
		sum = ""
		carry = 0
		digit_sum = 0
		
		while i<=y.length
			carry, digit_sum = digit_add(x.slice(x.length-i),y.slice(y.length-i),carry)
			sum = digit_sum.to_s+sum
			i+=1
		end
		while i<=x.length
			carry, digit_sum = digit_add(x.slice(x.length-i),"0",carry)
			sum = digit_sum.to_s+sum
			i+=1
		end
		carry>0 ? "1"+sum : sum
	end
	
	def pandigital_1_to_9?
		array = [0,0,0,0,0,0,0,0,0]
		self.each_char do |c|
			c_as_i = c.to_i-1
			array[c_as_i]+=1
			return false if array[c_as_i]>1
		end
		true 
	end

end

def longer_shorter(x,y)
	x.length>=y.length ? (return x, y) : (return y, x)
end

def digit_add(a,b,carry)
	sum = a.to_i+b.to_i+carry
	return sum/10, sum%10
end
