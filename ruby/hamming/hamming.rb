class Hamming
  VERSION = 1
  def self.compute(*args)
    dna1 = args[0]
    dna2 = args[1]
    
    raise ArgumentError if dna1.length != dna2.length

    distance = 0
    0.upto(dna1.length) do |item|
      distance += 1 if dna1[item] != dna2[item]
    end
    distance
  end
end