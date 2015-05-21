class TestClass

  def initialize(initialVal=0)
    @max = initialVal
  end

  def printMax
    puts @max
  end

  def iterate(array)
    array.each {|x| @max = x if x>@max}
  end

end
