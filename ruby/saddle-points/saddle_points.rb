#
class Matrix
  attr_reader :rows, :columns

  def initialize(str)
    @rows = str.split("\n").each_with_object([]) do |row, obj|
      obj << row.split(' ').map(&:to_i)
    end

    @columns = @rows.transpose
  end

  def saddle_points
    points = []
    @rows.each_with_index do |row, row_index|
      row.each_with_index do |item, index|
        next unless item >= row.sort.last && item <= @columns[index].sort.first
        points << [row_index, index]
      end
    end
    points
  end
end
