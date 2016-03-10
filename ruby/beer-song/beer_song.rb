#
class BeerSong
  VERSION = 2
  def verse(num)
    it = (num == 1) ? 'it' : 'one'

    semi_line2 =
      if num == 0
        'Go to the store and buy some more'
      else
        "Take #{it} down and pass it around"
      end

    line1 = "#{bottles(num).capitalize} of beer on the wall, #{bottles(num)} of beer."
    line2 = "#{semi_line2}, #{bottles(num - 1)} of beer on the wall."

    "#{line1}\n#{line2}\n"
  end

  def verses(verse1, verse2)
    verse1.downto(verse2).map { |num| verse(num) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  private

  def bottles(num)
    if num == 0
      'no more bottles'
    elsif num == 1
      "#{num} bottle"
    elsif num == -1
      '99 bottles'
    else
      "#{num} bottles"
    end
  end
end
