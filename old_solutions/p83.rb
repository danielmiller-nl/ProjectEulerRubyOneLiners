class PathSum
	
	def initialize(m)
		@unvisited_o = {}
		@mwidth = m[0].length
		@mheight = m.length

		m.each_with_index do |row,r_num|
			row.each_with_index do |column,c_num|
				value = column
				@unvisited_o[[r_num,c_num]] = [value,neighbours([r_num,c_num],@mwidth,@mheight)]
			end
		end
		@unvisited_o
	end
	
	def neighbours(rc,mwidth,mheight)
		neighbours = []
		if rc[0]<mheight-1
			neighbours << [rc[0]+1,rc[1]]
		end
		if rc[1]<mwidth-1
			neighbours << [rc[0],rc[1]+1]
		end
		if rc[0]>0
			neighbours << [rc[0]-1,rc[1]]
		end
		if rc[1]>0
			neighbours << [rc[0],rc[1]-1]
		end
		neighbours
	end
	
	def path_sum(start_row)
		unvisited = @unvisited_o.clone
		end_column = {}
		distances = {[start_row,0]=>unvisited[[start_row,0]][0]}
		end_column = {}
		while unvisited.size>0
			csd = coordinates_shortest_distance(distances)
			return distances[csd] if csd==[@mheight-1,@mwidth-1]
			current_vertex = unvisited[csd].dup
			unvisited.delete(csd)
			current_vertex[1].each do |neighbour|
				unless unvisited[neighbour].nil?
					possible_new_distance = distances[csd]+unvisited[neighbour][0]
					if distances[neighbour].nil?||possible_new_distance<distances[neighbour] #
						distances[neighbour] = possible_new_distance
					end
				end
			end
			distances.delete(csd)
		end
		#end_column[coordinates_shortest_distance(end_column)]
	end
	
	def coordinates_shortest_distance(hash)
		hash.min_by{|a|a[1]}[0]
	end
	
	
	
end

start = Time.now

test_matrix = []

File.open("matrix.txt").each{|line|test_matrix<<line.split(",").map{|vertex|vertex.to_i}}

test_path = PathSum.new(test_matrix)
puts test_path.path_sum(0)
#a = []
#(0...test_matrix.length).each do |start_row|
#	#puts "****************#{start_row}********************" 
#	a << test_path.path_sum(start_row)
#end
#puts a.min

puts "Runtime: #{Time.now-start}"





