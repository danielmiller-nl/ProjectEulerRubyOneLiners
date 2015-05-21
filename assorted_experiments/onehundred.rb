a = (2..100).to_a
i = 0
p = 2
while p<=10
	a.each {|x| print "#{x} "}
	puts
	puts "----"
	(0...a.length).step(p).each {|x| a[x+a.index(p)+p] = 0 if (x+a.index(p)+p)<=100}
	p = a.find{|x| x>p}
end
a.each {|x| print "#{x} "}

