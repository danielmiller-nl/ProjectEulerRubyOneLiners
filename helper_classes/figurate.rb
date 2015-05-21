class Integer

	def nth_Triangle
		n = self
		(n*(n+1))/2
	end
	
	def nth_Square
		n = self
		n*n
	end
	
	def nth_Pentagonal
		n = self
		(n* (3 * n - 1))/2 	
	end
	
	def nth_Hexagonal
		n = self
		(n*(2 * n - 1))
	end
	
	def nth_Heptagonal
		n = self
		(n*(5*n-3))/2
	end
	
	def nth_Octagonal
		n = self
		(n*(3*n-2))
	end

end


