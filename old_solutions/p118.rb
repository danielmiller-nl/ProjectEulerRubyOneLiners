require './integer_extensions'
require './array_extensions'

def primes_by_unique_digits(length)

	m_s_x_2 = Math.sqrt(10**(length-1)).to_i*2
	primes = m_s_x_2.primes_below
	primes_by_digits = Hash.new
	digits = *(1..9)
	(1...length).each do |n|
		permutations = digits.permutation(n).to_a
		array = []
		permutations.each do |p|
			
			p_i = p.dig_array_to_int
			array << p_i if p_i.is_prime?(primes) #&&p_i.all_digits_unique_no_zero?
		end
		primes_by_digits[n] = array
	end
	primes_by_digits	
	
end

def hash_by_missing(pbud)
	hash_by_missing = Hash.new
	pbud.each do |digits,array|
		hash = Hash.new
		array.each do |p|
			missing = p.missing_digits_1_9
			hash[missing] = [] if hash[missing].nil?
			hash[missing] << p
		end
		hash_by_missing[digits] = hash
	end
	hash_by_missing
end

#def missing_opposite(missing)
#	missing.map {|n| n==0 ? 1 : 0}
#end

def match(missing, possible_find)
	if number(possible_find) > number(missing)
		new_missing = possible_find.clone
		possible_find = missing.clone
	else
		new_missing = missing.clone
	end
	new_missing.each_index do |i|
		if new_missing[i]==0 && possible_find[i]==0
			return nil
		end
		if new_missing[i]==1 && possible_find[i]==0
			new_missing[i] = 0
		end
	end
	new_missing 
end

def number(missing)
	missing.count {|d| d==1}
end

def set_count(hbm, missing, size_search, prev_match = 0)
	count = 0
	number_missing = number(missing)
	if number_missing==0
		count = 1
	else
		i = size_search
		pm = prev_match
		#puts "* missing:#{missing}"
		while i>=1
			puts "*-* i:#{i} number_missing:#{number_missing} size_search:#{size_search} pm:#{pm}"
			hbma = hbm[i].to_a
			hbma.drop(pm).each_with_index do |h,index|
				puts "*-*-* h:#{h}"
				new_missing = match(missing,h[0])
				new_size_search = (number_missing>=i*2||(number_missing>=i&&pm>0)) ? i : number_missing-i
				puts "*-*-*. new_missing:#{new_missing} new_size_search:#{new_size_search}"
				unless new_missing.nil?
					if new_size_search==i
						pm = index+1
					end
					sc = set_count(hbm,new_missing,new_size_search,pm)
					count+=h[1].length*sc
					puts "*-*-*-* sc:#{sc} count:#{count}"
					
				end
			end
			i-=1
			pm = 0
		end
	end
	count
end



h = hash_by_missing(primes_by_unique_digits(9))

#h.each do |s,a|
#	puts s
#	a.each {|x,y| puts "#{x} : #{y}"}
#end

c = set_count(h,[1, 1, 1, 1, 1, 1, 1, 1, 1],2)
puts c
