class RightDownPath
	
	def initialize(m)
		@matrix = Array.new(m.length) { Array.new(m[0].length) }
		m.each_with_index do |row,r_num|
			row.each_with_index do |vertex,v_num|
				@matrix[r_num][v_num] = [vertex,nil]
			end
		end
		i = 0
		while i < @matrix.length
			@matrix[i][0][1] = [i,0]
			i+=1
		end
	end
	
	def fill_values
		@matrix.each_with_index do |row,r_num|
			row.each_with_index do |vertex,v_num|
				if v_num+1<row.length
					if @matrix[r_num][v_num+1][1].nil?
						@matrix[r_num][v_num+1][1] = [r_num,v_num]
					else
						possible_new_sum = min_sum_path([r_num,v_num])+@matrix[r_num][v_num+1][0]
					#@matrix[r_num][v_num+1][1]
					#@matrix[r_num][v_num+1][1].nil? ? (puts "#{r_num} #{v_num} nil") : (puts "#{r_num} #{v_num} #{@matrix[r_num][v_num][1]} #{@matrix[r_num][v_num+1][0]} #{min_sum_path([r_num,v_num+1])} #{possible_new_sum}")
						@matrix[r_num][v_num+1][1] = [r_num,v_num] if min_sum_path([r_num,v_num+1])>possible_new_sum
					end
				end
				if r_num+1<@matrix.length
					if @matrix[r_num+1][v_num][1].nil?
						@matrix[r_num+1][v_num][1] = [r_num,v_num]
					else
						possible_new_sum = min_sum_path([r_num,v_num])+@matrix[r_num+1][v_num][0]
					#@matrix[r_num+1][v_num][1]
					#@matrix[r_num+1][v_num][1].nil? ? (puts "#{r_num} #{v_num} nil") : (puts "#{r_num} #{v_num} #{@matrix[r_num][v_num][1]} #{@matrix[r_num+1][v_num][0]} #{min_sum_path([r_num+1,v_num])} #{possible_new_sum}") 
						@matrix[r_num+1][v_num][1] = [r_num,v_num] if min_sum_path([r_num+1,v_num])>possible_new_sum
					end
				end
				if r_num>0
					if @matrix[r_num-1][v_num][1].nil?
						@matrix[r_num-1][v_num][1] = [r_num,v_num]
					else
						possible_new_sum = min_sum_path([r_num,v_num])+@matrix[r_num-1][v_num][0]
					#min_sum_path(@matrix[r_num-1][v_num][1])
					#@matrix[r_num-1][v_num][1].nil? ? (puts "#{r_num} #{v_num} nil") : (puts "#{r_num} #{v_num} #{@matrix[r_num][v_num][1]} #{min_sum_path(@matrix[r_num][v_num][1])} #{@matrix[r_num-1][v_num][0]} #{min_sum_path([r_num-1,v_num])} #{possible_new_sum}") 
						@matrix[r_num-1][v_num][1] = [r_num,v_num] if min_sum_path([r_num-1,v_num])>possible_new_sum
					end
				end
			end
			#self.print
			#puts "-----"
		end
	end
	
	def fill_reverse
		@matrix.each_with_index do |row,r|
			r_num = @matrix.length-1-r
			@matrix[r_num].each_with_index do |vertex,v_num|
				if v_num+1<row.length
					if @matrix[r_num][v_num+1][1].nil?
						@matrix[r_num][v_num+1][1] = [r_num,v_num]
					else
						possible_new_sum = min_sum_path([r_num,v_num])+@matrix[r_num][v_num+1][0]
					#@matrix[r_num][v_num+1][1]
					#@matrix[r_num][v_num+1][1].nil? ? (puts "#{r_num} #{v_num} nil") : (puts "#{r_num} #{v_num} #{@matrix[r_num][v_num][1]} #{@matrix[r_num][v_num+1][0]} #{min_sum_path([r_num,v_num+1])} #{possible_new_sum}")
						@matrix[r_num][v_num+1][1] = [r_num,v_num] if min_sum_path([r_num,v_num+1])>possible_new_sum
					end
				end
				if r_num+1<@matrix.length
					if @matrix[r_num+1][v_num][1].nil?
						@matrix[r_num+1][v_num][1] = [r_num,v_num]
					else
						possible_new_sum = min_sum_path([r_num,v_num])+@matrix[r_num+1][v_num][0]
					#@matrix[r_num+1][v_num][1]
					#@matrix[r_num+1][v_num][1].nil? ? (puts "#{r_num} #{v_num} nil") : (puts "#{r_num} #{v_num} #{@matrix[r_num][v_num][1]} #{@matrix[r_num+1][v_num][0]} #{min_sum_path([r_num+1,v_num])} #{possible_new_sum}") 
						@matrix[r_num+1][v_num][1] = [r_num,v_num] if min_sum_path([r_num+1,v_num])>possible_new_sum
					end
				end
				if r_num>0
					if @matrix[r_num-1][v_num][1].nil?
						@matrix[r_num-1][v_num][1] = [r_num,v_num]
					else
						possible_new_sum = min_sum_path([r_num,v_num])+@matrix[r_num-1][v_num][0]
					#min_sum_path(@matrix[r_num-1][v_num][1])
					#@matrix[r_num-1][v_num][1].nil? ? (puts "#{r_num} #{v_num} nil") : (puts "#{r_num} #{v_num} #{@matrix[r_num][v_num][1]} #{min_sum_path(@matrix[r_num][v_num][1])} #{@matrix[r_num-1][v_num][0]} #{min_sum_path([r_num-1,v_num])} #{possible_new_sum}") 
						@matrix[r_num-1][v_num][1] = [r_num,v_num] if min_sum_path([r_num-1,v_num])>possible_new_sum
					end
				end
			end
			#self.print
			#puts "-----"
		end
	end
	
	def min_sum_path(coordinate)
		c = coordinate.dup
		sum = 0
		#puts "#{c.inspect} #{@matrix[c[0]][c[1]][0]} #{@matrix[c[0]][c[1]][1]}"
		until @matrix[c[0]][c[1]][1] == c
			sum+=@matrix[c[0]][c[1]][0]
			c = @matrix[c[0]][c[1]][1].dup 
		end
		sum+@matrix[c[0]][c[1]][0]
	end
	
	def print
		@matrix.each {|row| puts row.inspect}
	end
	
	def matrix
		@matrix
	end
	
	def min_sum
		min =  min_sum_path([0,@matrix[0].length-1])
		#puts min
		i = 1
		while i < @matrix[0].length
			#puts min_sum_path([i,@matrix[0].length-1])
			min = min<min_sum_path([i,@matrix[0].length-1]) ? min : min_sum_path([i,@matrix[0].length-1])
			i+=1
		end
		#puts "-----"
		min
	end
	
end

test_matrix = []

File.open("testmatrix2.txt").each{|line|test_matrix<<line.split(" ").map{|vertex|vertex.to_i}}

test_path = RightDownPath.new(test_matrix)
test_path.fill_values
test_path.fill_reverse

=begin
File.open("t1.txt","w") do |f|
	test_path.matrix.each_with_index {|r,i| f.puts "#{i} #{r.inspect} #{test_path.min_sum_path([i,test_path.matrix[0].length-1])}"}
end
=end

puts test_path.min_sum







