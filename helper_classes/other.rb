def greatest_that doesThis
  greatest = 0
  Proc.new do |x|
    greatest = x if x>greatest && doesThis.call(x)
    greatest
  end
end