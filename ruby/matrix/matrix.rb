#
class Matrix
  attr_reader :rows, :columns

  def initialize(str)
    @rows = str.split("\n").each_with_object([]) do |row, obj|
      obj << row.split(' ').map(&:to_i)
    end

    @columns = @rows.transpose
  end
end
