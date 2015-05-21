require_relative 'integer_extensions'
require_relative 'array_extensions'

def rev_inc(n)
	n.digits.even? ? rev_inc_e(n) : rev_inc_o(n)
end

$evens = [0,2,4,6,8]
$odds = [1,3,5,7,9]

def dig_inc_e(ind_to_inc, array)
	array[ind_to_inc] += 1
	
	if array[ind_to_inc] == 10
		array[ind_to_inc] = 0
		dig_inc_e(ind_to_inc-1,array)
		dig_inc_e(array.length-ind_to_inc-1,array) if array[array.length-ind_to_inc-1].even?
	end

	number_to_increase = array[ind_to_inc]
	number_partner = array[array.length-ind_to_inc-1]
	np_even = number_partner.even?

	same_case = number_partner.odd? == number_to_increase.odd?
	greater_than_9 = number_partner+number_partner.odd>9
	
	index = number_to_increase/2
	
	if same_case&&greater_than_9
		if ind_to_inc == array.length - 1
			np_even? ? array[ind_to_inc] = 1  : array[ind_to_inc] = 2
		else
			number_to_increase<array.length/2 ? array[array.length-ind_to_inc-1] = (ind_to_inc == 0 ? (np_even? ? 2 : 1) : 0) : array[ind_to_inc] = 0
		end
		number_to_increase<array.length/2 ? dig_inc_e(array.length-ind_to_inc-2,array) : dig_inc_e(ind_to_inc-1,array)
	elsif same_case
		number_to_increase<array.length/2 ? dig_inc_e(array.length-ind_to_inc-1,array) : dig_inc_e(ind_to_inc,array)
	elsif greater_than_9
		if ind_to_inc == array.length - 1
			!np_even? ? array[ind_to_inc] = 1  : array[ind_to_inc] = 2
		else
			!np_even? ? array[ind_to_inc] = 1  : array[ind_to_inc] = 0
		end
		number_to_increase<array.length/2 ? dig_inc_e(ind_to_inc+1,array) : dig_inc_e(ind_to_inc-1,array)
	end
end

def rev_inc_e(n)
	array = n.digit_array
	length = array.length
	half_length = length/2
	d = 1
	c = -1
	while d<=half_length
		same_case = array[d-1].odd? == array[length-d].odd?
		greater_than_9 = array[d-1]+array[length-d]>9
		while same_case||greater_than_9
			same_case ? array[length-d]+=1 : array[length-d]=10
			if array[length-d]==10
				c = length-d
				while array[c]==10
					if c==0
						array.unshift(1)
						break
					end
					array[c]=0
					array[c-1]+=1
					c-=1
				end
				array[(c+1)..length-1] = [0]*(length-c-1)
			end
			
			same_case = array[d-1].odd? == array[length-d].odd?
			greater_than_9 = array[d-1]+array[length-d]>9
		end
		if c>-1
			d = 1
			c = -1
		else
			d+=1
		end
		if array[-1]==0
			array[-1]=1
			d=1
		end
	end
	new_n = array.dig_array_to_int
	#puts "#{n} #{new_n} #{length} #{array.length} #{array.inspect}" 
	array.length>length ? rev_inc(new_n) : new_n
end

def array_jump(array)
	#puts "* "+array.inspect
	aj = array
	half_length = aj.length/2
	if aj[half_length]>=5
		aj[half_length..aj.length-1] = [0]*(aj.length-half_length)	
		aj[half_length-1]+=1
		aj[half_length-1] == 10 ? (return array_jump(aj)) : (return aj) 
	end
	c = aj.index(10)
	while aj[c]==10
		if c==0
			aj[c..aj.length-1] = [0]*(aj.length)
			aj.unshift(1)
			return aj
		end
		aj[c]=0
		aj[c-1]+=1
		c-=1
	end
	#puts "** "+aj.inspect
	aj
end

def rev_inc_o(n)
	array = n.digit_array
	length = array.length
	return rev_inc(10**length) if length%4!=3
	half_length = length/2
	d = 1
	while d<=half_length
		array = array_jump(array) if array[half_length]>=5
		return rev_inc_e(array.dig_array_to_int) if array.length>length
		while ((array[d-1].odd? == array[length-d].odd?) == (d-1).even?) || ((array[d-1]+array[length-d]>9) != (d-1).even?)
			array[length-d]+=1
			array = array_jump(array) if array[length-d]==10||array[half_length]>=5
			return rev_inc_e(array.dig_array_to_int) if array.length>length
		end
		d+=1
		if array[-1]==0
			array[-1]=1
			d=1
		end
	end
	new_n = array.dig_array_to_int
	array.length>length ? rev_inc(new_n) : new_n
end

start = Time.now
count = 0
i = 1
while i<1000000
	i = rev_inc(i)
	print " #{i} " if i>8000&&i<102000
	count+=1
	puts if count%10==0&&(i>8000&&i<102000)
	i+=2
end
puts "count: #{count-1}"
puts "Time: #{Time.now-start}"
