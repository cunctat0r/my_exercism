#
class Triangle
  attr_reader :rows

  def initialize(row_number)
    @row_number = row_number
    @rows = []
    calculate_rows
  end

  def calculate_rows
    1.upto(@row_number) do |row|
      @rows <<
        if row == 1
          [1]
        elsif row == 2
          [1, 1] 
        else
          (0..row - 1).to_a.each_with_object([]) do |num, the_row|
            the_row << (num == 0 || num == row - 1 ? 1 : @rows.last[num] + @rows.last[num - 1])
          end
        end
    end
  end
end
