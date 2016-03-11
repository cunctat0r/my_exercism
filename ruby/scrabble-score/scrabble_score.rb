#
class Scrabble
  SCORES = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }.freeze

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil?
    return 0 unless @word.upcase[/^[A-Z]+$/]
    new_scores = transform(SCORES)

    res = 0
    @word.chars.each do |char|
      new_scores.each do |key, value|
        res += value if char.upcase == key
      end
    end
    res
  end

  def self.score(word)
    new(word).score
  end

  private

  def transform(input)
    result = {}
    input.each do |key, value|
      value.each do |val|
        result[val.upcase] = key
      end
    end
    result
  end
end
