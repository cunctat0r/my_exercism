#
class Crypto
  def initialize(input)
    @text = input
  end

  def normalize_plaintext
    @text.downcase.chars.select { |char| char.match(/\w/) }.join
  end

  def size
    len = normalize_plaintext.length
    1.upto(len) do |i|
      return i if i**2 >= len
    end
  end

  def plaintext_segments
    normalize_plaintext.chars.each_slice(size).map(&:join)
  end

  def ciphertext
    encode.join('').strip
  end

  def normalize_ciphertext
    encode.map(&:join).join(' ').strip
  end

  private

  def encode
    plaintext_segments.each_with_object([]) do |segment, square|
      segment.chars.each_with_index do |char, i|
        square[i] ||= []
        square[i] << char
      end
    end
  end
end
