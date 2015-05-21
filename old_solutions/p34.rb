require_relative 'integer_extensions'

class Integer
	def dig_fact?
		n = self
		sum = 0
		while n>0
			sum += (n%10).factorial
			n /= 10
		end
		sum == self
	end
	
	def dig_fact_sum_a
		n = self
		sum = 0
		while n>0
			sum += (n%10).factorial
			n /= 10
		end
		sum
	end
	
	def dig_fact_sum_b
		n = self.to_s.split('')
		n.collect! {|x| x.to_i.factorial}
		n.inject(:+)
	end
end

(1..2600000).each {|n| puts n if n.dig_fact_sum_b==n}






