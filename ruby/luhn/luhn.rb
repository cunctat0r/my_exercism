#
class Luhn
  def initialize(num)
    @init = num.to_s
  end

  def addends
    @init
      .chars
      .map(&:to_i)
      .reverse
      .collect
      .with_index(1) do |item, index|
        if index.odd?
          item
        else
          item *= 2
          item -= 9 if item > 10
        end
        item
      end.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    checksum % 10 == 0 ? true : false
  end

  def self.create(num)
    remainder = Luhn.new(num * 10).checksum % 10
    check_digit = (remainder == 0) ? remainder : 10 - remainder
    num * 10 + check_digit
  end
end
