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
    @hex.reverse.chars.each_with_index.inject(0) do |res, (chr, i)|
      res +
        if RULES[chr]
          RULES[chr] * 16**i
        elsif chr =~ /[0-9]/
          chr.to_i * 16**i
        end
    end
  end
end
