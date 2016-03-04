class Bob
  def hey(str)      
    reply = 'Whatever.'    
    reply = 'Fine. Be that way!' if (str[/^\s+$/] or str == '')
    reply = 'Sure.' if str.end_with?('?')          
    reply = 'Whoa, chill out!' if str == str.upcase && str.match(/[[:alpha:]]+/)
    reply
  end
end