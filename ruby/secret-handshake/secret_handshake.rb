#
class SecretHandshake
  def initialize(num)
    @bin = (num.is_a? Integer) ? num : 0
  end

  def commands
    return [] if @bin.zero?
    cmd = {
      0 => 'wink',
      1 => 'double blink',
      2 => 'close your eyes',
      3 => 'jump'
    }

    arr = cmd.each_with_object([]) do |(key, value), array|
      array << value if (@bin & 2**key) != 0
    end
    arr.reverse! if (@bin & 16) != 0
    arr
  end
end
