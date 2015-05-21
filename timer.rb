def Timer
	start = Time.now
	yield
	puts Time.now-start
end
