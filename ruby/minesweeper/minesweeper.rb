#
class Board
  def self.transform(input)
    input.each_with_index do |row, index|
      if index == 0 || index == input.length - 1
        raise ValueError unless row =~ /^\+-*\+$/
        next
      end
      prev_row = input[index - 1]
      next_row = input[index + 1]
      raise ValueError if row.size != prev_row.size
      raise ValueError unless row =~ /^\|(\ |\*|[0-9])*\|$/
      row.chars.each_with_index do |char, char_index|
        next unless char == '*'
        add_mine(row, char_index - 1)
        add_mine(row, char_index + 1)
        add_mine(prev_row, char_index)
        add_mine(prev_row, char_index - 1)
        add_mine(prev_row, char_index + 1)
        add_mine(next_row, char_index)
        add_mine(next_row, char_index - 1)
        add_mine(next_row, char_index + 1)
      end
    end
  end

  def self.add_mine(row, position)
    if row[position] == ' '
      row[position] = '1'
    elsif row[position] =~ /\d/
      row[position] = (row[position].to_i + 1).to_s
    end
    row
  end
end
