class Say
  ONES = {1 => 'one',
          2 => 'two',
          3 => 'three',
          4 => 'four',
          5 => 'five',
          6 => 'six',
          7 => 'seven',
          8 => 'eigth',
          9 => 'nine',
          10 => 'ten',
          11 => 'eleven',
          12 => 'twelwe',
          13 => 'thirteen'}

  def initialize(num)
    @num = num
  end

  def in_english
    return 'zero' if @num == 0
    return ONES[@num] if @num <= 13    
    return "#{ONES[@num - 10]}teen" if @num < 20
    if @num < 100
      res = definite_decades @num
      return res      
    end

    if @num < 1000
      res = definite_hundreds @num
      return res      
    end

    if @num < 1_000_000
      tst = @num.divmod(1000)
      hundreds = tst[1]
      thousands = tst[0]

      thou_word = "#{ONES[thousands]} thousand"
      thou_word += 's' if thousands > 1 

      res = thou_word
      if @num - 1000 * thousands > 0
        res += ' '
        res += definite_hundreds(@num - 1000 * thousands)
      end
      return res    
    end
    
    res
  end

  def definite_decades(num)
    tst = num.divmod(10)
    ones = tst[1]
    decades = tst[0]
    
    dec_word =
      if decades == 2
        'twenty' 
      elsif decades == 3
        'thirty'
      else
        "#{ONES[decades]}ty"
      end
    one_word = ones == 0 ? '' : "-#{ONES[ones]}"
    return "#{dec_word}#{one_word}"
  end

  def definite_hundreds(num)
    tst = num.divmod(100)
    decades = tst[1]
    hundreds = tst[0]

    hund_word = "#{ONES[hundreds]} hundred"
    #hund_word += 's' if hundreds > 1 

    res = hund_word
    if @num - 100 * hundreds > 0
      res += ' '
      res += definite_decades(num - 100 * hundreds)
    end
    return res    
  end

end