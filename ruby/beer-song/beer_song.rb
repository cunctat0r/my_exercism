#
class BeerSong
  VERSION = 2
  def verse(num)
    it = 'one'
    i_bottles = (num - 1 == 1) ? 'bottle' : 'bottles'
    w_bottles = (num == 1) ? 'bottle' : 'bottles'
    was_bottles = num
    case num
    when 0
      was_bottles = 'no more'
      is_bottles = 99
    when 1
      it = 'it'
      is_bottles = 'no more'
    else
      is_bottles = num - 1
    end

    semi_line2 =
      if num == 0
        'Go to the store and buy some more'
      else
        "Take #{it} down and pass it around"
      end

    line1 = "#{was_bottles} #{w_bottles} of beer on the wall, #{was_bottles} #{w_bottles} of beer.".capitalize
    line2 = "#{semi_line2}, #{is_bottles} #{i_bottles} of beer on the wall."

    "#{line1}\n#{line2}\n"
  end

  def verses(verse1, verse2)
    result = ''
    verse1.downto(verse2) do |num|
      result += "#{verse(num)}\n"
    end
    result.chomp!
  end

  def lyrics
    verses(99, 0)
  end
end
