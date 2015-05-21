require_relative './array_extensions.rb'
require_relative '../helper_classes/figurate.rb'

class Integer

	def factorial
		(self == 1)||(self == 0) ? 1 : self*(self-1).factorial
	end

	def length
		n = self
		length = 0
		while n>0
			length+=1
			n/=10
		end
		length
	end

	def divisors_that(*args)
		divisors = self.proper_divisors(self.primes_below).uniq
		meet_all_conditions = []
		divisors.each do |x|
			meet_all_conditions << x if args.all? {|y| y.call(x)}
		end
		meet_all_conditions
	end

	def square
		self**2
	end

	def hyperExp(k)
		k == 1 ? self : self**(self.hyperExp(k-1))
	end

	def dtz #drop trailing zeroes
		dropped = self
		while(dropped%10==0)
			dropped/=10
		end
		dropped
	end

	def coprimes(prime_list=[])
		if prime_list.size==0
			n = self
			coprimes = []
			(1...n).each {|pcp| coprimes << pcp if n.gcd(pcp)==1}
			coprimes
		else
			prime_factors = self.prime_factors(prime_list)
			coprimes = []
			array = *(1...self)
			prime_factors.each do |pf|
				array.iterate_index(pf-1,pf) {|n| array[n]=0}
			end
			array.each {|n| coprimes << n if n!=0}
			coprimes
		end
	end

	def gcd(second_integer)
		a = self
		b = second_integer
		while b!=0
			t = b
			b = a%b
			a = t
		end
		a
	end

	def digits #counts number of digits
		n = self
		digits = 0
		while n > 0
			n/=10
			digits+=1
		end
		digits
	end

	def primes_below
		a = self.odd? ? Array.new((self-3)/2,true) : Array.new(1+(self-3)/2,true)
		[9,25,35].each do |x|
			inc = 0
			x == 9 ? inc = 3 : inc = 15
			to_delete = (x/2)-1
			while to_delete<=self
				a[to_delete] = false
				to_delete += inc 
			end
		end
		i = 2 
		p = 7
		while p<=Math.sqrt(self).to_i
			to_delete = i+(p*(p-1))/2
			while to_delete<=self
				a[to_delete] = false
				to_delete += p 
			end
			i+=1
			while a[i]==false
				i+=1
			end
			p = i*2+3
		end
		primes = [2]
		a.each_index {|x| primes << x*2+3 if a[x]}
		primes
	end

	def divisible_by_any?(array)
		array.each {|divisor| return true if self%divisor==0}
		false
	end

	def divisible_by?(n)
		self%n==0
	end

	def next_prime
		primes_below_sqrt_of_self = Math.sqrt(self).to_i.primes_below
		prime_above_sqrt = primes_below_sqrt_of_self.last + 2
		prime_above_sqrt += 2 until !prime_above_sqrt.divisible_by_any?(primes_below_sqrt_of_self)
		primes_to_check_next_prime = primes_below_sqrt_of_self << prime_above_sqrt
		next_prime = self.even? ? self + 1 : self + 2
		next_prime += 2 until !next_prime.divisible_by_any?(primes_to_check_next_prime)
		next_prime
	end

	def is_prime?(prime_list) #error: 967.is_prime?((Math.sqrt(1000).to_i+1).primes_below)
		return false if self<2
		i = 0
		sqrt = Math.sqrt(self)
		while prime_list[i]<=sqrt
			return false if self%prime_list[i]==0
			i+=1
		end
		true
	end

	def digit_array
		array = []
		n = self
		while n!=0
			array << n%10
			n/=10
		end
		array.reverse
	end

	def digit_sum
		sum = 0
		n = self
		while n!=0
			sum+=n%10
			n/=10
		end
		sum
	end

	def next_palindrome
		p = self
		return p+2 if (p+1).pow10?
		pl = p.length
		increase = 10**(pl/2)
		pHead = p/increase
		if pHead%10 == 9
			pNewHead = pHead+1
			pToTail = pNewHead
			pToTail/=10 until pToTail%10!=0
			pNewHead*increase + pToTail.reverse
		else
			p+=increase
			pl.even? ? p+increase/10 : p
		end
	end

  def prev_palindrome
  	p = self
    return p-2 if (p-1).pow10?
    pl = p.length
    decrease = 10**(pl/2)
    pHead = p/decrease
    if pHead%10 == 0
      pNewHead = pHead-1
      pToTail = pl.even? ? pNewHead : pNewHead/10
      pNewHead*decrease + pToTail.reverse
    else
      p-=decrease
      pl.even? ? p-decrease/10 : p
    end
  end

	def reverse
		n = self
		reversed = 0
		count = 0
		until n == 0
			reversed*=10
			reversed+=n%10
			n/=10
		end
		reversed
	end

	def all_digits_x?
		n = self
		while n!=0
			return false if !yield(n%10)
			n/=10
		end
		true
	end

	def greatest_pow_below num
		return self if self==0||self==1
		n = self
		while n*self<num
			n*=self
		end
		n
	end

	def prime_factors(prime_list=[])
		prime_factors = Array.new
		n = self
		if(prime_list.length<1)
			test_factor = 2
			until n == 1 do
				prime_factors << test_factor if n.divisible_by?(test_factor)
				while n.divisible_by?(test_factor) do
					n/=test_factor
				end
			test_factor+=1
			end
		else
			half_n = n.to_f/2.0
			i = 0
			prime = prime_list[i]
			while n>1&&prime<=half_n
				prime_factors << prime if n%prime==0
				while n%prime==0
					n/=prime
				end
				i+=1
				prime = prime_list[i]
			end
		end
		prime_factors
	end
	
	def prime_factorization(prime_list)
		n = self
		i = 0
		prime_factorization = []
		while n>1
			prime = prime_list[i]
			factors = []
			while n%prime==0
				factors << prime
				n/=prime
			end
			prime_factorization << factors unless factors.empty?
			i+=1
		end
		prime_factorization
	end

	def sum_proper_divisors(prime_list)
		pf = prime_factorization(prime_list)
		sums = []
		pf.each do |p|
			sum = 0
			0.upto(p.length) do |i|
				sum += p[0]**i
			end
			sums.push(sum)
		end
		sums.product
	end

	def proper_divisors(prime_list, pd_hash={}, pf_hash={})
		return pd_hash[self] unless pd_hash[self].nil?
		pf_hash[self].nil? ? prime_factorization = prime_factorization(prime_list) : prime_factorization = pf_hash[self]
		
		self_sqrt = Math.sqrt(self)
		proper_divisors = [1]
		prime_factorization.each do |factors|
			first_factor = factors[0]
			first_add = proper_divisors.length
			new_factors = []
			proper_divisors.each do |pd|
				new_factor = pd*first_factor
				break if new_factor>self_sqrt 
				new_factors << new_factor
			end
			proper_divisors+=new_factors
			last_add = proper_divisors.length-1
			i = 1
			while i<factors.length
				new_factors = []
				(first_add..last_add).each do |pd|
					new_factor = proper_divisors[pd]*factors[i]
					break if new_factor>self_sqrt 
					new_factors << new_factor
				end
				proper_divisors+=new_factors
				first_add = last_add+1
				last_add = proper_divisors.length-1
				i+=1
			end
		end
		j = proper_divisors.length-1
		j-=1 if proper_divisors[j] == self_sqrt
		while j>=1
			proper_divisors << self/proper_divisors[j]
			j-=1
		end
		proper_divisors
	end

	def is_triangle?
		a = Math.sqrt(self*2)
		a_floor = a.floor
		return false if a == a_floor
		(self*2).to_f/a.floor == a.ceil
	end

	def is_square?
		sqrt = Math.sqrt(self).floor
		sqrt*sqrt == self
	end

	def nth_digit_from_left(n)
		length = self.digits
		(self/(10**(length-n)))%10
	end
	
	def nth_digit_from_right(n)
		self%(10**n)/(10**(n-1))
	end

	def pow10?
		n = self
		while n%10==0
			n/=10
		end
		n == 1
	end

	def palindrome?
		n = self
		reverse = 0
		while n>0
			reverse = reverse*10+n%10
			n/=10
		end
		self==reverse
	end

	def pandigital_one_to_nine?
		return false if self<100000000||self>999999999
		n = self
		array = Array.new(9,0)
		while n>0
			d = n%10
			return false if d==0
			array[d-1]+=1
			return false if array[d-1]>1
			n/=10
		end
		true
	end

	def all_digits_unique?
		n = self
		array = Array.new(10,0)
		while n>0
			d = n%10
			array[d]+=1
			return false if array[d]>1
			n/=10
		end
		true
	end

	def all_digits_unique_no_zero?
		n = self
		array = Array.new(9,0)
		while n>0
			d = n%10
			return false if d==0
			array[d-1]+=1
			return false if array[d-1]>1
			n/=10
		end
		true
	end

	def missing_digits_1_9
		n = self
		array = Array.new(9,0)
		while n>0
			d = n%10
			next if d==0
			array[d-1]+=1
			n/=10
		end
		array.map {|x| x==0 ? 1 : 0}
	end

end
