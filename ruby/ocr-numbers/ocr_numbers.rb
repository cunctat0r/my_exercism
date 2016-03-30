#
class OCR
  def initialize(text)
    @text = text
  end

  def convert
    rows = get_rows(@text)
    rows.each_with_object('') do |row, res|
      normalized = normalize(row)
      res << "#{normalized.each_with_object('') { |item, str| str << get_digit(item) }},"
    end.chop!
  end

  private

  def get_rows(text)
    rows = []
    lines = text.split("\n")
    num_of_rows = lines.size / 4
    0.upto(num_of_rows - 1) do |row|
      rows[row] ||= ''
      rows[row] << "#{lines[4 * row + 0]}\n"
      rows[row] << "#{lines[4 * row + 1]}\n"
      rows[row] << "#{lines[4 * row + 2]}\n"
      rows[row] << "#{lines[4 * row + 3]}"
    end
    rows
  end

  def normalize(text)
    lines = text.split("\n")
    digits = []
    num_of_digits = lines[0].size / 3
    lines.each do |line|
      0.upto(num_of_digits - 1) do |digit|
        digits[digit] ||= ''
        digits[digit] << line[3 * digit, 3]
      end
    end
    digits
  end

  def get_digit(text)
    case text
    when ' _ | ||_|   '
      '0'
    when '     |  |   '
      '1'
    when ' _  _||_    '
      '2'
    when ' _  _| _|   '
      '3'
    when '   |_|  |   '
      '4'
    when ' _ |_  _|   '
      '5'
    when ' _ |_ |_|   '
      '6'
    when ' _   |  |   '
      '7'
    when ' _ |_||_|   '
      '8'
    when ' _ |_| _|   '
      '9'
    else
      '?'
    end
  end
end
