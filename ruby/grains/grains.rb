#
class Grains
  def self.square(square_number)
    2**(square_number - 1)
  end

  def self.total    
    (1..64).to_a.each.inject(0) do |total, square_number|
      total + square(square_number)
    end
  end
end
