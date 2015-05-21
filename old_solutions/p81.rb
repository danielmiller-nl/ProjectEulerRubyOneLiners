class RightDownPath
	
	def initialize(m)
		@matrix = Array.new(m.length) { Array.new(m[0].length) }
		m.each_with_index do |row,r_num|
			row.each_with_index do |vertex,v_num|
				@matrix[r_num][v_num] = [vertex,nil]
			end
		end
		
		@matrix[0][0][1] = @matrix[0][0][0]
	end
	
	def fill_values
		@matrix.each_with_index do |row,r_num|
			row.each_with_index do |vertex,v_num|
				if v_num+1<row.length
					possible_new_value = @matrix[r_num][v_num][1]+@matrix[r_num][v_num+1][0]
					if @matrix[r_num][v_num+1][1].nil?||@matrix[r_num][v_num+1][1]>possible_new_value
						@matrix[r_num][v_num+1][1] = possible_new_value
					end
				end
				if r_num+1<@matrix.length
					possible_new_value = @matrix[r_num][v_num][1]+@matrix[r_num+1][v_num][0]
					if @matrix[r_num+1][v_num][1].nil?||@matrix[r_num+1][v_num][1]>possible_new_value
						@matrix[r_num+1][v_num][1] = possible_new_value
					end
				end
			end
		end
	end
	
	def shortest_path_topleft_bottomright
		@matrix.last.last.last
	end
	
	def print
		@matrix.each {|row| puts row.inspect}
	end
	
end

test_matrix = []

File.open("matrix.txt").each{|line|test_matrix<<line.split(",").map{|vertex|vertex.to_i}}

test_path = RightDownPath.new(test_matrix)
test_path.fill_values
puts test_path.shortest_path_topleft_bottomright


