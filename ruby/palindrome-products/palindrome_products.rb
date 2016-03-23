#
class Palindromes
  #
  class Palindrome
    attr_reader :value, :factors
    def initialize(value, factors = [])
      @value = value
      @factors = factors
    end
  end

  def initialize(max_factor: 1, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def generate
    @palindromes = {}
    @min_factor.upto(@max_factor) do |first_factor|
      first_factor.upto(@max_factor) do |second_factor|
        product = first_factor * second_factor
        next unless palindrome?(product)
        @palindromes[product] ||= Palindrome.new(product, [])
        @palindromes[product].factors << [first_factor, second_factor].sort
      end
    end
    @palindromes
  end

  def largest
    @palindromes.values.sort_by(&:value).last
  end

  def smallest
    @palindromes.values.sort_by(&:value).first
  end

  private

  def palindrome?(num)
    num.to_s == num.to_s.reverse
  end
end
