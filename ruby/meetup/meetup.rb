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
    date_begin.upto(date_end).each_with_object([]) do |item, obj|
      obj << item if item.send((the_day.to_s + '?').to_sym)
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
      arr.select { |item| item.day > 10 && item.day < 20 }.last
    else
      arr[sel_hash[selector]]
    end
  end
end
