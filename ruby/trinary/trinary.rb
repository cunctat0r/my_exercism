#
class Trinary
  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    return 0 unless @trinary =~ /^(0|1|2)+$/
    result = 0
    @trinary.reverse.each_char.with_index(0) do |chr, i|
      result += chr.to_i * 3**i
    end
    result
  end
end
