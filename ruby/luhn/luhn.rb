#
class Luhn
  def initialize(num)
    @init = num.to_s
  end

  def addends
    arr = []
    @init.chars.reverse.map(&:to_i).each_with_index do |item, index|
      arr <<
        if index.even?
          item
        else
          tmp = 2 * item
          tmp >= 10 ? tmp - 9 : tmp
        end
    end
    arr.reverse!
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
    "#{num}#{check_digit}".to_i
  end
end
