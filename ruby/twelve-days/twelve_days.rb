#
class TwelveDays
  VERSION = 1

  GIFTS = {
    first: 'a Partridge in a Pear Tree',
    second: 'two Turtle Doves',
    third: 'three French Hens',
    fourth: 'four Calling Birds',
    fifth: 'five Gold Rings',
    sixth: 'six Geese-a-Laying',
    seventh: 'seven Swans-a-Swimming',
    eighth: 'eight Maids-a-Milking',
    ninth: 'nine Ladies Dancing',
    tenth: 'ten Lords-a-Leaping',
    eleventh: 'eleven Pipers Piping',
    twelfth: 'twelve Drummers Drumming'
  }.freeze
  DAYS = GIFTS.keys.freeze

  def self.song
    DAYS.each_with_object('') do |day, the_verse|
      the_verse << "On the #{day} day of Christmas my true love gave to me, "
      the_verse << (day == :first ? "#{GIFTS[day]}.\n\n" : verse(day))
    end.chomp
  end

  def self.verse(day)
    the_index = DAYS.index(day)
    return "and #{GIFTS[day]}.\n\n" if the_index == 0
    "#{GIFTS[day]}, #{verse(DAYS[the_index - 1])}"
  end
end
