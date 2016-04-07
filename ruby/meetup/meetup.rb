#
class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day_of_week, selector)
    select(collect(day_of_week), selector)
  end

  def collect(the_day)
    date_begin = Date.new(@year, @month, 1)
    date_end = Date.new(@year, @month, -1)
    (date_begin..date_end).select do |date|
      date.send((the_day.to_s + '?').to_sym)
    end
  end

  def select(arr, selector)
    sel_hash = {
      first: 0,
      second: 1,
      third: 2,
      fourth: 3,
      last: -1
    }
    if selector == :teenth
      arr.reverse.find { |item| item.day > 12 && item.day < 20 }
    else
      arr[sel_hash[selector]]
    end
  end
end
