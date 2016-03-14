#
class Hexadecimal
  RULES = { 'a' => 10,
            'b' => 11,
            'c' => 12,
            'd' => 13,
            'e' => 14,
            'f' => 15 }.freeze

  def initialize(hex)
    @hex = hex
  end

  def to_decimal
    return 0 unless @hex[/^[0-9a-f]+$/]
    res = 0
    @hex.reverse.chars.each_with_index do |chr, i|
      res += RULES[chr] * 16**i if RULES[chr]
      res += chr.to_i * 16**i if chr =~ /[0-9]/
    end
    res
  end
end
