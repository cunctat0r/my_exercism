#
class Anagram
  def initialize(in_str)
    @in_str = in_str
  end

  def match(words)
    words.select { |word| anagram? word.downcase, @in_str.downcase }
  end

  private

  def anagram?(word1, word2)
    return false if word1 == word2
    word1.chars.sort! == word2.chars.sort!
  end
end
