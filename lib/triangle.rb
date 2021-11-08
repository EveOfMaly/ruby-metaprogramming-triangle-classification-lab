require 'pry'
class Triangle

  attr_accessor :x, :y, :z


  def initialize(x,y,z)
    @x = x 
    @y = y 
    @z = z
  end

  def kind
    validate_triangle
    if x == y && y == z
      :equilateral
    elsif  x == y ||  y == z || x == z
      :isosceles
    else
       :scalene
    end
  end

  def validate_triangle

    real_triangle = [(x + y) > z ,(y + z ) > x ,(x + z) > y]

    [x,y,z].each do |side|
      real_triangle << false if side <= 0
      raise TriangleError if real_triangle.include?(false) 
    end
  
  end


  class TriangleError  < StandardError
    puts "there is an error with the triangle"
  end 

end


# triangle = Triangle.new(5, 4, 2)
# triangle.validate_triangle
# triangle2 = Triangle.new(1, 1, 3)
# triangle2 .validate_triangle
# triangle3 = Triangle.new(2, 4, 2)
# triangle3.validate_triangle
# triangle4 = Triangle.new(7, 3, 2)
# triangle4.validate_triangle




