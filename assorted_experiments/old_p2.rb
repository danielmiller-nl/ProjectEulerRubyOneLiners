require 'prime'

class Integer
	def if_int_is(method)
		m = method+"?"
		(self.send(m)) ? (return self) : (return 0)
	end
end

def first_n_fibs(n)
	fibs = (n-2).times.each_with_object([1,1]) { |num, obj| obj << obj[-2] + obj[-1] }
end

def fibs_upto(inc_limit)
	a = [1,1] 
	until a[-2]+a[-1] > inc_limit do a << a[-2]+a[-1] end
	a
end

def fibsum(n = 0,option = nil, inc_limit = 0)
  if inc_limit == 0
  	fibs = first_n_fibs(n) 
  elsif n == 0
  	fibs = fibs_upto(inc_limit)
  else
  	fibs1 = first_n_fibs(n)
  	fibs2 = fibs_upto(inc_limit)
  	fibs = (fibs1.length>fibs2.length) ? fibs2 : fibs1 
  end
  sum = fibs.inject(0) { |sum,fib| (option.nil?) ? sum + fib : sum + fib.if_int_is(option) }
end

puts fibsum(0,"even",4000000)
