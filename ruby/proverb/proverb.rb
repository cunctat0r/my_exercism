#
class Proverb
  def initialize(*words, qualifier: '')
    verse(words, qualifier)
  end

  def verse(words, qualifier)
    @str = ""
    0.upto(words.length - 2) do |index|
      @str += "For want of a #{words[index]} the #{words[index + 1]} was lost.\n"
    end

    @str += "And all for the want of a #{qualifier.empty? ? '' : qualifier + ' '}#{words[0]}."
    @str
  end

  def to_s
    @str
  end
end
