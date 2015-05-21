require_relative 'integer_extensions.rb'

class Fraction
	
	attr_accessor :numerator, :denominator
	
	def initialize(n,d)
		@numerator = n
		@denominator = d
	end
	
	def reduce
		gcd = @numerator.gcd(@denominator)
		Fraction.new(@numerator/gcd, @denominator/gcd)
	end
	
	def reduce!
		gcd = @numerator.gcd(@denominator)
		@numerator/=gcd
		@denominator/=gcd
	end
	
	def inverse
		Fraction.new(@denominator,@numerator)
	end
	
	def inverse!
		temp = @numerator
		@numerator = @denominator
		@denominator = temp
	end
	
	def to_f
		@numerator.to_f / @denominator.to_f
	end
	
	def +(other_fraction)
		new_denominator = self.denominator*other_fraction.denominator
		new_numerator = self.numerator*other_fraction.denominator+other_fraction.numerator*self.denominator
		Fraction.new(new_numerator,new_denominator)
	end
	
	def -(other_fraction)
		new_denominator = self.denominator*other_fraction.denominator
		new_numerator = self.numerator*other_fraction.denominator-other_fraction.numerator*self.denominator
		Fraction.new(new_numerator,new_denominator)
	end
	
	def *(other_fraction)
		new_denominator = self.denominator*other_fraction.denominator
		new_numerator = self.numerator*other_fraction.numerator
		Fraction.new(new_numerator,new_denominator)
	end
	
	def /(other_fraction)
		new_numerator = self.numerator*other_fraction.denominator
		new_denominator = self.denominator*other_fraction.numerator
		Fraction.new(new_numerator,new_denominator)
	end
	
	def to_s
		"#{@numerator} / #{@denominator}"
	end
	
	def print_h
		print "#{@numerator} / #{@denominator}"
	end
	
	def print_v
		puts @numerator
		puts "-"*@denominator.digits
		puts @denominator
	end
	
end
