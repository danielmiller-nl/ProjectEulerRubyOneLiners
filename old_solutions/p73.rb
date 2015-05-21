def coprimes(start,max)
	coprimes = [start]

	m = start[0]
	n = start[1]
	
	b = [[2*m-n,m],[2*m+n,m],[m+2*n,n]]
	
	unless b.all? {|a|a[0]>max}
		b.each do |a|
			coprimes(a,max).each {|sa| array << sa if sa[0]<=max} if a[0]<=max 
		end
	end
	array
end

def prfb(start,max)
	array = [start]
	prfb = [start]

	i = 0
	
	while i<prfb.size
		m = prfb[i][0] 
		n = prfb[i][1]
		b = [[2*m-n,m],[2*m+n,m],[m+2*n,n]]
	
		b.each do |a|
			prfb << a if a[0]<=max
		end
		
		i+=1
	end
	prfb
end

def prfb_13_12(start,max)
	array = [start]
	prfb = [start]

	i = 0
	
	while i<prfb.size
		#puts "#{i} #{prfb.inspect}"
		m = prfb[i][0] 
		n = prfb[i][1]
		b = [[2*m-n,m],[2*m+n,m],[m+2*n,n]]
	
		b.each do |a|
			prfb << a if a[0]<=max
		end
		fraction = n.to_f/m.to_f
		one_third = 1.0/3.0
		one_half = 1.0/2.0
		
		if fraction<one_third||fraction>one_half 
			prfb.delete_at(i)
			i-=1
		end 
		
		i+=1
	end
	prfb
end

def proper_reduced_fractions_below(n)
	prfb([2,1],n)+prfb([3,1],n)
end

def prf_between_13_12(n)
	prfb_13_12([2,1],n)+prfb_13_12([3,1],n)
end

start = Time.now
puts prf_between_13_12(2000).size
puts "#{Time.now-start}"

