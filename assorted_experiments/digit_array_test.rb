require_relative 'integer_extensions.rb'

start = Time.now
x = []
10000000.times {|n| x=n.digits}
puts "#{Time.now-start}"


