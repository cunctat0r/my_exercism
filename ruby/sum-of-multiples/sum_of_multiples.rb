#
class SumOfMultiples
  def initialize(*vars)
    @set = vars
  end

  def self.to(num)
    new(3, 5).to(num)
  end

  def to(num)
    return 0 if num == 1
    1.upto(num - 1).select { |item| condition?(item) }.reduce(:+)
  end

  private

  def condition?(num)
    @set.inject(false) { |a, e| a || (num % e == 0) }
  end
end
