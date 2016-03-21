class Say
  ONES = {1 => 'one',
          2 => 'two',
          3 => 'three',
          4 => 'four',
          5 => 'five',
          6 => 'six',
          7 => 'seven',
          8 => 'eight',
          9 => 'nine',
          10 => 'ten',
          11 => 'eleven',
          12 => 'twelwe',
          13 => 'thirteen'}

  def initialize(num)
    raise ArgumentError if num < 0 || num >= 1_000_000_000_000
    @num = num
  end

  def in_english
    return 'zero' if @num == 0
    return to_text(@num) if @num < 1_000_000
    
    res = ""
    ch = chunks(@num)    
    (ch.length - 1).downto(0) do |index|
      if ch[index] != 0
        res += to_text(ch[index])
        case index
        when 1
          res += ' thousand '
        when 2          
          res += ' million '
        when 3
          res += ' billion '
        end
      end
      
    end
    res.strip!
    res
  end

  def to_text(num)
    return ONES[num] if num <= 13    
    return "#{ONES[num - 10]}teen" if num < 20
    if num < 100
      res = define_decades num
      return res      
    end

    if num < 1000
      res = define_hundreds num
      return res      
    end

    if num < 1_000_000
      res = define_thousands num
      return res    
    end
  end

  def chunks(num)
    chunk_arr = []
    num.to_s.reverse!.chars.each_slice(3).to_a.each do |arr|
      chunk_arr << arr.reverse!.join.to_i
    end
    chunk_arr
  end

  def define_decades(num)
    return ONES[num] if num <= 13
    return "#{ONES[num - 10]}teen" if num < 20
    decades, ones = num.divmod(10)
    
    dec_word =
      case decades
      when 2
        'twenty'
      when 3
        'thirty'
      when 4
        'forty'
      when 5
        'fifty'
      when 8
        'eighty'
      else
        "#{ONES[decades]}ty"
      end      
    
    one_word = ones == 0 ? '' : "-#{ONES[ones]}"    
    return "#{dec_word}#{one_word}"
  end

  def define_hundreds(num)
    hundreds, decades = num.divmod(100)
    
    hund_word = "#{ONES[hundreds]} hundred"
    
    res = hund_word
    if num - 100 * hundreds > 0
      res += ' '
      res += define_decades(num - 100 * hundreds)
    end
    return res    
  end

  def define_thousands(num)
    tst = num.divmod(1000)
    hundreds = tst[1]
    thousands = tst[0]

    thou_word = "#{ONES[thousands]} thousand"
    thou_word += 's' if thousands > 1 

    res = thou_word
    if num - 1000 * thousands > 0
      res += ' '
      res += define_hundreds(num - 1000 * thousands)
    end
    return res
  end

end