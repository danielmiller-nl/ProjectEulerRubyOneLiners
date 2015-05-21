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

end

def longer_shorter(x,y)
	x.length>=y.length ? (return x, y) : (return y, x)
end

def digit_add(a,b,carry)
	sum = a[0].ord+b[0].ord-96+carry
	return sum/10, sum%10
end
