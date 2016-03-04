class Phrase
  VERSION = 1
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    counts = Hash.new(0)
    words = @phrase.split(/[ ,.:!&@$%^\n]/)
    words.each do |word|
      word.gsub!(/^\'/i, "")
      word.gsub!(/\'$/i, "")
      counts[word.to_s.downcase] += 1 unless word.to_s.downcase == ""
    end
    counts
  end
end