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
    res = 0
    @dna.chars.each { |chr| res += 1 if chr == nucleo }
    res
  end

  def histogram
    keys = %w(A T C G)
    keys.each_with_object(Hash.new(0)) { |key, hsh| hsh[key] = count(key) }
  end
end
