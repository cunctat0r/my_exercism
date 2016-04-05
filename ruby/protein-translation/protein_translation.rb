#
class Translation
  def self.of_codon(codon)
    return 'Methionine' if codon =~ /^AUG$/
    return 'Phenylalanine' if codon =~ /^UU(C|U)$/
    return 'Leucine' if codon =~ /^UU(A|G)$/
    return 'Serine' if codon =~ /^UC(U|C|A|G)$/
    return 'Tyrosine' if codon =~ /^UA(U|C)$/
    return 'Cysteine' if codon =~ /^UG(U|C)$/
    return 'Tryptophan' if codon =~ /^UGG$/
    return 'STOP' if codon =~ /^U(A(A|G)|GA)$/
    raise InvalidCodonError
  end

  def self.of_rna(sequence)
    sequence
      .chars
      .each_slice(3)
      .map(&:join)
      .each_with_object([]) { |slice, proteins| proteins << of_codon(slice) }
      .take_while { |protein| protein != 'STOP' }
  end
end

class InvalidCodonError < StandardError; end
