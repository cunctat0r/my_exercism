class Complement
  VERSION = 3
  def self.of_dna(*args)
    dna = args[0]    
    rna = ""
    complements = {'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U'}

    dna.each_char do |c| 
      if complements[c]
        rna += complements[c]
      else
        raise ArgumentError 
      end
    end

    rna
  end
end