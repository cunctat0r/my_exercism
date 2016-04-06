#
class Phrase
  VERSION = 1
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = @phrase.split(/[ ,.:!&@$%^\n]/)
    words.each_with_object(Hash.new(0)) do |word, counts|
      word.gsub!(/^\'/i, '')
      word.gsub!(/\'$/i, '')
      word.to_s.downcase!
      counts[word] += 1 unless word == ''
    end
  end
end
