#
class Atbash
  def self.encode(text)
    plain = 'abcdefghijklmnopqrstuvwxyz'.split('')
    cipher = 'zyxwvutsrqponmlkjihgfedcba'.split('')

    text.downcase.chars.each_with_object('') do |char, obj|
      obj << cipher[plain.index(char)] if char [/[a-zA-z]/]
      obj << char if char[/\d/]
    end.chars.each_slice(5).map(&:join).join(' ')
  end
end
