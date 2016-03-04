# Binary
class Binary
  VERSION = 1
  def initialize(input_string)
    raise ArgumentError unless input_string[/^(0|1)+$/]
    @input_string = input_string
  end

  def to_decimal
    result = 0
    @input_string.reverse!
    0.upto(@input_string.length - 1) do |index|
      result += @input_string[index].to_i * 2**index
    end
    result
  end
end
