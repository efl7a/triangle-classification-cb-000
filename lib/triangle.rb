class Triangle
  # write code here
  attr_accessor :side_one, :side_two, :side_three, :kind

  def initialize(l_one, l_two, l_three)
    @side_one = l_one
    @side_two = l_two
    @side_three = l_three
    @kind = self.kind
  end

  def kind
    case
    when !(self.valid?)
      raise TriangleError
    when self.side_one == self.side_two && self.side_two == self.side_three
      :equilateral
    when self.side_one == self.side_two || self.side_one == self.side_three || self.side_two == self.side_three
      :isosceles
    else
      :scalene
    end
  end

  def valid?
     if self.side_one <= 0 || self.side_two <= 0 || self.side_three <= 0
       false
     elsif self.side_one + self.side_two > self.side_three && self.side_three + self.side_two > self.side_one && self.side_one + self.side_three > self.side_two
       true
     else
       false
    end
  end
end

class TriangleError < StandardError
  def message
    "This is not a valid triangle."
  end
end
