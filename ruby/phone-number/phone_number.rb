#
class PhoneNumber
  def initialize(vars)
    @num = vars.split(/[ \-()\.]/).join('')
  end

  def number
    return '0000000000' if @num =~ /\D+/
    return '0000000000' if @num.length < 10 || @num.length > 11
    if @num.length == 11
      @num = (@num[0] == '1') ? @num[1..@num.length] : '0000000000'
    end
    @num
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..10]}"
  end
end
