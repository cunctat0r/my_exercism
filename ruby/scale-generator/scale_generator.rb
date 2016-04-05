#
class Scale
  attr_reader :name

  SCALE = %w(A A# B C C# D D# E F F# G G#).freeze
  SCALE_FLAT = %w(A Bb B C Db D Eb E F Gb G Ab).freeze
  KEYS = %w(F g d).freeze

  def initialize(tonic, type, model = 'm' * 11)
    @tonic = tonic
    @type = type
    @model = model
    @name = "#{@tonic.capitalize} #{@type}"
  end

  def pitches
    scale = set_scale
    tonic_index = scale.index(@tonic.capitalize)
    pitches = scale[tonic_index..-1] + scale[0...tonic_index]
    return pitches if @model == 'm' * 11
    pointer = 0
    @model.chars.each_with_object([]) do |interval, new_pitches|
      new_pitches << pitches[pointer]
      pointer += 1 if interval == 'm'
      pointer += 2 if interval == 'M'
      pointer += 3 if interval == 'A'
    end
  end

  def set_scale
    @tonic =~ /.b/ || KEYS.include?(@tonic) ? SCALE_FLAT : SCALE
  end
end
