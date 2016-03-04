class Fixnum
  VERSION = 1
  def to_roman
    arab = self
    roman = ""

    hh = {:hundreds => ['C', 'D', 'M'],
      :tens => ['X', 'L', 'C'],
      :ones => ['I', 'V', 'X']
    }   

    thousands = arab.div(1000)
    hundreds = (arab - thousands*1000).div(100)
    tens = (arab - thousands*1000 - hundreds*100).div(10)
    ones = (arab - thousands*1000 - hundreds*100 - tens*10)
    
    if thousands > 0       
        roman += 'M' * thousands
    end     
    
    roman += select_roman(hh[:hundreds], hundreds) if hundreds > 0  
    roman += select_roman(hh[:tens], tens) if tens > 0  
    roman += select_roman(hh[:ones], ones) if ones > 0  
      
    roman
  end

private 
  def select_roman(selector, num)    
    roman = ""
    case num
    when 1...4
      roman += "#{selector[0]}" * num
    when 4
      roman += "#{selector[0]}#{selector[1]}"
    when 5
      roman += "#{selector[1]}"
    when 6...9
      roman += ("#{selector[1]}" + "#{selector[0]}" * (num - 5))
    when 9
      roman += "#{selector[0]}#{selector[2]}"
    end        
    roman
  end

end