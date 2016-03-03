class Complement
  VERSION = 3
  def self.of_dna(*args)
    dna = args[0]    
    raise ArgumentError if dna =~ /[^GCTA]/

    dna.gsub(/./, 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U')
  end
end