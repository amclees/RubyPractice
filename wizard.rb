class Wizard < Array
  attr_accessor :temperature

  def shivering?
    @temperature < 10
  end

  def [](index)
    index = rand(4) if rand > 0.9 && @temperature > 17.5
    super
  end

  def []=(index, value)
    value = 4 if rand > 0.75 && @temperature > 17.5
    super
  end
end
