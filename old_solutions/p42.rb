class String

	def ord_sum
		sum = 0
		self.split("").each {|letter| sum+=(letter.ord-64) if letter =~ /[A-Z]/}
		sum
	end

end

class Integer

	def triangle?
		double = self*2
		(double == Math.sqrt(double).floor*Math.sqrt(double).ceil)&&( Math.sqrt(double).floor!=Math.sqrt(double).ceil)
	end
	
end


count = 0
word_array = File.open("words.txt").read.split(",")
word_array.each do |word
	count+=1 if word.ord_sum.triangle?
end
puts count



