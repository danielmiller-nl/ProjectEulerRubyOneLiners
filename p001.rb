require './extensions/array_extensions.rb'

puts (0...1000).to_a.select{|x| x%3==0||x%5==0}.sum