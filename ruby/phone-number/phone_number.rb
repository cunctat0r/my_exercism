#
class PhoneNumber
  def initialize(vars)
    @num = vars.split(/[ \-()\.]/).join('')
  end

  def number
    bad_number = '0000000000'
    return bad_number if @num =~ /\D+/
    return bad_number if @num.length < 10 || @num.length > 11
    return bad_number if @num.length == 11 && !@num.start_with?('1')
    @num = @num[1..@num.length] if @num.length == 11
    @num
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..10]}"
  end
end
