#
class School
  VERSION = 1
  def initialize
    @school = Hash.new([])
  end

  def add(name, grade)
    @school[grade] +=  [name]
  end

  def to_h
    @school.each { |_key, value| value.sort! }.sort.to_h
  end

  def grade(grd)
    @school[grd].sort
  end
end
