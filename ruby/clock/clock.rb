#
class Clock
  class << self
    alias at new
  end

  def initialize(hours, minutes = 0)
    @hours = hours
    @minutes = minutes
    resolve_time
  end

  def to_s
    "#{fmt(@hours)}:#{fmt(@minutes)}"
  end

  def +(minutes)
    self.class.new(@hours, @minutes + minutes)
  end

  def -(minutes)
    self + -minutes
  end

  def ==(another)
    to_s == another.to_s
  end

  private

  def fmt(val)
    (val < 10) ? "0#{val}" : val.to_s
  end

  def resolve_time
    @hours += (@minutes / 60)
    @hours %= 24
    @minutes %= 60
  end
end
