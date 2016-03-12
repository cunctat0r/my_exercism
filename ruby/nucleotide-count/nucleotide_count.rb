#
class Nucleotide
  class << self
    alias from_dna new
  end

  def initialize(sequence)
    raise ArgumentError if sequence =~ /[^GCTA]/
    @dna = sequence
  end

  def count(nucleo)
    return 0 if @dna.empty?
    @dna.chars.count(nucleo)
  end

  def histogram
    keys = %w(A T C G)
    keys.each_with_object(Hash.new(0)) { |key, hsh| hsh[key] = count(key) }
  end
end
