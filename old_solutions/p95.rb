require_relative 'integer_extensions'
require_relative 'array_extensions'

$primes = 1000000.primes_below


def sum_pd(n)
	n.proper_divisors($primes).sum		
end

$chains = {}

def chain_length(chain,nexT)
	chain.push(nexT)
	sp = sum_pd(nexT)
	if nexT%2==1||sp%2==1
		$chains[nexT] = 0
		return 0
	elsif $chains[nexT] != nil
		return $chains[nexT]
	#elsif $chains[sp] != nil
		#return $chains[sp]
	elsif sp == 1 || sp>1000000
		$chains[nexT] = 0
		return 0
	elsif sp == nexT && chain.length == 1
		$chains[nexT] = 1
		return 1
	elsif sum_pd(sp) == nexT && chain.length == 2
		$chains[nexT] = 2
		$chains[sp] = 2
		return 2
	else
		ci = chain.index(sp)
		until ci != nil || $chains[sp] != nil || sp%2==1 || sp > 1000000
			chain.push(sp)
			#puts "sp: #{sp}"
			sp = sum_pd(sp)
			ci = chain.index(sp)
		end
		puts "#{nexT} #{chain}"
		pre_loop = []
		loop = []
		if ci == nil
			chain.each {|link| $chains[link] = 0}
		else
			pre_loop = chain[0,ci]
			loop = chain[ci..-1]
			pre_loop.each {|link| $chains[link] = 0}
			loop.each {|link| $chains[link] = loop.length}
		end
		#return pre_loop.length > 0 ? loop.length : 0
	end
end

=begin
def chain_length(chain,length,nexT)
	#puts "#{chain} #{length} #{nexT}"
	ci = chain.index(nexT)
	if $chains[nexT] != nil
		#puts "1"
		chain.push(nexT)
		return $chains[nexT] #== 0 ? 0 : length+$chains[nexT]
	elsif ci != nil
		#puts "2"
		return chain.length-ci
	else
		chain.push(nexT)
		length+=1
		s = sum_pd(nexT)
		return 0 if nexT==1||nexT>1000000
		$chains[nexT] = chain_length(chain,length,s)
		#puts "#{chain} #{nexT} #{$chains[nexT]}"
		#puts "#{$chains}"
		testA = sum_pd(nexT) == chain.last
		#return $chains[nexT] if testA
		#puts "* #{chain} #{nexT} #{$chains[nexT]}"
		return testA && chain.index(nexT) != 0 || $chains[nexT] == 0 ? 0 : $chains[nexT]
	end
end
=end

def chains_To(upTo)
	1.upto(upTo) do |n|
		puts "#{n}" if n%1000==0
		chain_length([],n)
		#puts "#{$chains}"
	end
end

#chains_To(110)

def max_length
	max_l = 0
	max_n = 0
	$chains.each_pair do |number,length|
		if length!=nil&&length>max_l
			max_l = length
			max_n = number
		end
	end
	[max_n,max_l]
end
