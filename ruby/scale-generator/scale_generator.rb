#
class Scale
  attr_reader :name

  SCALE = %w(A A# B C C# D D# E F F# G G#).freeze
  SCALE_FLAT = %w(A Bb B C Db D Eb E F Gb G Ab).freeze

  def initialize(tonic, type, model = 'm' * 11)
    @tonic = tonic.capitalize
    @type = type
    @model = model
    @name = "#{@tonic} #{@type}"
  end

  def pitches
    scale = (@tonic =~ /.b/ ? SCALE_FLAT : SCALE)
    tonic_index = scale.index(@tonic)
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
end
