#
class Hamming
  VERSION = 1
  def self.compute(*args)
    dna1 = args[0]
    dna2 = args[1]
    raise ArgumentError if dna1.length != dna2.length
    (0..dna1.length).to_a.inject(0) do |distance, item|
      dna1[item] == dna2[item] ? distance : distance + 1
    end
  end
end
