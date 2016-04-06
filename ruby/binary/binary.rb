# Binary
class Binary
  VERSION = 1
  def initialize(input_string)
    raise ArgumentError unless input_string[/^(0|1)+$/]
    @input_string = input_string
  end

  def to_decimal
    @input_string.reverse!
    @input_string.chars.each_with_index.inject(0) do |result, (char, index)|
      result + char.to_i * 2**index
    end
  end
end
