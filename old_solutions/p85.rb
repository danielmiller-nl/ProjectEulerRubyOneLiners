def rectangle_count(width,height)
	sum = 0
	(1..width).each do |s_width|
		(1..height).each {|s_height|  sum+=(width-s_width+1)*(height-s_height+1)}
	end
	sum
end

def distance_to_2million(n)
	(2000000-n).abs
end

closest = 2000000
area = 0
dimensions = ""

(1..80).each do |width|
	(1..80).each do |height|
		new_closest = distance_to_2million(rectangle_count(width,height))
		if new_closest<closest
			closest = new_closest
			dimensions = width.to_s+"x"+height.to_s
			area = width*height 
		end
	end
end

puts "#{dimensions} #{area} #{closest}"


