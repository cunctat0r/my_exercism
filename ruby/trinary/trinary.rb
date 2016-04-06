#
class Trinary
  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    return 0 unless @trinary =~ /^(0|1|2)+$/
    @trinary.reverse.chars.each_with_index.inject(0) do |res, (chr, i)|
      res + chr.to_i * 3**i
    end
  end
end
