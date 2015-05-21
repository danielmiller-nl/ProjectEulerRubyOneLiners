class String
	def palindrome?
		self == self.reverse
	end
end

sum = 0
(1..999999).each {|n| sum+=n if n.to_s.palindrome? && n.to_s(2).palindrome? }
puts sum


