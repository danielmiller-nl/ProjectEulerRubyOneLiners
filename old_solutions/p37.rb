class Integer
	
	def digits
		n = self
		digits = 0
		while n > 0
			n/=10
			digits+=1
		end
		digits
	end
	
	def trunctable_left(array)
		n = self
		trunctable = true
		while trunctable && n > 0
			trunctable = array.include?(n)
			n = n%(10**(n.digits-1))
		end
		trunctable
	end
	
	def trunctable_right(array)
		n = self
		trunctable = true
		while trunctable && n > 0
			trunctable = array.include?(n)
			n/=10
		end
		trunctable
	end
	
	def trunctable(array)
		self.trunctable_left(array)&&self.trunctable_right(array)
	end
	
	def trunctable_prime?(prime_list)
		n = self
		trunctable = true
		while trunctable && n > 0
			trunctable = n.prime_?(prime_list)
			n = n%(10**(n.digits-1))
		end
		if trunctable
			n = self
			while trunctable && n > 0
				trunctable = n.prime_?(prime_list)
				n/=10
			end
		end
		trunctable
	end
	
	def prime_?(prime_list)
		return false if self==1
		i=0
		while prime_list[i]<=Math.sqrt(self)
			if self%prime_list[i]==0
				return false
			end
			i+=1
		end
		true
	end
	
	def primes_below
		a = (2..self).to_a
		i = 0
		p = a[i]
		while p<=Math.sqrt(self).to_i
			to_delete = i+p*(p-1)
			while to_delete<=self
				a[to_delete] = 0
				to_delete += p 
			end
			i+=1
			while a[i]==0
				i+=1
			end
			p = a[i]
		end
		a.select {|x| x>0}
	end
	
end

class Array

	def first_x(x)
		count = 0
		i = 0
		first_x = []
		while count<x&&i<self.length
			if yield(self[i])
				count+=1
				first_x << self[i]
			end
			i+=1
		end
		first_x
	end

end

a = 1000000.primes_below
puts a.first_x(11){|y| y.trunctable_prime?(a)&&y>10}.inject(:+)}


