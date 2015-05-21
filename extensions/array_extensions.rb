require_relative './integer_extensions.rb'

class Array
	
	def build_sequence(stop_when)
    last = self.last
    until stop_when.call(last)
      self << yield(last) 
      last = self.last
    end
    self
  end

	def first_index_to
		i = 0
		while i<self.size
			if yield(self[i])
				return i
			end
			i+=1
		end
		nil
	end
	
	def iterate(start = 0,inc)
		i = start
		while i<self.length
			yield(self[i])
			i+=inc
		end
	end
	
	def iterate_index(start = 0,inc)
		i = start
		while i<self.length
			yield(i)
			i+=inc
		end
	end

	def upto(max)
		upto = Array.new
		self.sort.each do |i| 
			break if i>max
			upto << i
		end
		upto
	end
	
	def sum
		if block_given?
			sum = 0
			self.each {|n| sum += yield(n)}
			sum
		else
			sum = 0
			self.each {|n| sum += n}
			sum
		end
	end
	
	def product
		if block_given?
			product = 1
			self.each {|n| product *= yield(n)}
			product
		else
			product = 1
			self.each {|n| product *= n}
			product
		end
	end
	
	def dig_array_to_int
		int = 0
		self.each_index {|d| int += self[d]*(10**(self.length-d-1))}
		int
	end
	
	def to_i
		i = 0
		length = 0
		self.reverse_each do |n|
			i += n*(10**length)
			length += n.digits
		end
		i
	end
	
	def sequence?
		i = 1
		while i<self.length
			return false if !yield(self[i-1],self[i])
			i+=1
		end
		true
	end

end
