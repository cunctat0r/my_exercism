class Grains
  def self.square(square_number)
    2**(square_number - 1)
  end

  def self.total
    total = 0
    1.upto(64) do |square_number|
      total += 2**(square_number - 1)
    end
    total
  end  
end