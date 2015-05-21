require_relative 'fraction.rb'

i = 0
one = Fraction.new(1,1)
two = Fraction.new(2,1)
c = Fraction.new(1,2)
count = 0
while i<1000
	#puts (one+c).reduce.to_s
	new_convergent = (one+c).reduce
	count+=1 if new_convergent.numerator.digits>new_convergent.denominator.digits
	c = (two + c).reduce.inverse
	i+=1 
end
puts count
