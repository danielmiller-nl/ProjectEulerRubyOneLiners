require './extensions/integer_extensions.rb'
require './extensions/array_extensions.rb'

def div_by_two_three_dig_nums?(x)
  n = 999
  m = x/n
  until m>=1000
    return true if m*n == x && m>100
    n-=1
    m = x/n
  end
  false
end

puts [999999].build_sequence(Proc.new{|x|div_by_two_three_dig_nums?(x)}){|last|last.prev_palindrome}.last


