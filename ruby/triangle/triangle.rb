#
class Triangle
  def initialize(a, b, c)
    raise TriangleError if a <= 0 || b <= 0 || c <= 0
    raise TriangleError if (a >= b + c) || (b >= a + c) || (c >= b + a)
    @a = a
    @b = b
    @c = c
  end

  def kind
    return :equilateral if @a == @b && @b == @c
    return :isosceles if @a == @b || @b == @c || @a == @c
    :scalene
  end
end

#
class TriangleError < StandardError
end
