#
class Cipher
  attr_reader :key
  def initialize(key = 'dddddddddd')
    raise ArgumentError unless key == key.downcase
    raise ArgumentError if key =~ /\d+/
    raise ArgumentError if key.empty?
    @key = key
    @max_distance = ('z'.ord - 'a'.ord + 1)
  end

  def encode(plaintext)
    result = ''
    plaintext.chars.each_with_index do |char, index|
      shift_distance = (@key[index].ord - 'a'.ord)
      encoded_char = char.ord + shift_distance
      result <<
        if encoded_char > 'z'.ord
          (encoded_char - @max_distance).chr
        else
          encoded_char.chr
        end
    end
    result
  end

  def decode(encoded_text)
    result = ''
    encoded_text.chars.each_with_index do |char, index|
      shift_distance = (@key[index].ord - 'a'.ord)
      decoded_char = char.ord - shift_distance
      result <<
        if decoded_char < 'a'.ord
          (decoded_char + @max_distance).chr
        else
          decoded_char.chr
        end
    end
    result
  end
end
