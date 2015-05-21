require_relative 'integer_extensions.rb'

$figurates = ["Triangle","Square","Pentagonal","Hexagonal","Heptagonal","Octagonal"]

def create_array_of(figure)
	figurate = "nth_"+figure
	a = []
	n = 1
	nth_figurate = n.send(figurate)
	while(nth_figurate<10000)
		a.push(four_dig_to_a(nth_figurate)) if nth_figurate>=1000
		n += 1
		nth_figurate = n.send(figurate)
	end
	a	
end

def four_dig_to_a(fd)
	[(fd-(fd%100))/100,fd%100]
end

def create_all_arrays
	arrays = []
	$figurates.each do |f|
		arrays.push(create_array_of(f))
	end
	arrays
end

def match(fdA,fdB)
	fdA[1] == fdB[0]
end

def match_n_in_a(n,a)
	a.assoc(n[1])
end

$f_arrays = create_all_arrays

def find_cycle
	perms = [0,1,2,3,4,5].permutation(6).to_a
	perms.each do |p|
		$f_arrays[p[0]].each do |m|
			i = 1
			cycle = []
			cycle.push(m)
			while i<=4
				mn = match_n_in_a(m,$f_arrays[p[i]])
				if mn != nil
					i += 1
					m = mn
					cycle.push(m)
				else
					break
				end
			end
			if cycle.length==5
				$f_arrays[p[5]].each do |z|
					if match(cycle[4],z)&&match(z,cycle[0])
						cycle.push(z)
						break
					end
				end
			end
			return cycle if cycle.length==6
		end
	end
end

def sum_cycle(cycle)
	sum = 0
	cycle.each do |x|
		sum += x[0]*100+x[1]
	end
	sum
end

=begin
def count_4digits_of_all
	a = ["Triangle","Square","Pentagonal","Hexagonal","Heptagonal","Octagonal"]
	total = 0
	a.each do |f|
		total += count_4digits_of(f)
	end
	total
end

def count_4digits_of(figure)

	figurate = "nth_"+figure
	count = 0
	n = 1
	nth_figurate = n.send(figurate)
	while(nth_figurate<10000)
		count += 1 if nth_figurate>=1000
		n += 1
		nth_figurate = n.send(figurate)
	end
	count	
	
end
=end
