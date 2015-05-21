require_relative 'integer_extensions.rb'

class Integer

	def ftd(start=1,pre_ftd=1)
		n = self
		ftd = pre_ftd
		start.upto(n) do |x|
			ftd *= x
			ftd = ftd.dtz%1000000
		end
		ftd
	end

end
