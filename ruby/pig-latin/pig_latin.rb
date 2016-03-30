#
class PigLatin
  def self.translate(text)
    text.split(' ').map { |word| to_pig(word) }.join(' ')
  end

  def self.to_pig(text)
    if text =~ /^([aoeui]|yt|xr)\w*/
      text
    elsif text =~ /^(sch|thr|.qu)\w*/
      text[3, text.length] + text[0, 3]
    elsif text =~ /^(ch|th|qu)\w*/
      text[2, text.length] + text[0, 2]
    else
      text[1, text.length] + text[0]
    end + 'ay'
  end
end
