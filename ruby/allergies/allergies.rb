#
class Allergies
  ALLERGENS = {
    eggs: 1,
    peanuts: 2,
    shellfish: 4,
    strawberries: 8,
    tomatoes: 16,
    chocolate: 32,
    pollen: 64,
    cats: 128
  }.freeze

  def initialize(rank)
    @rank = rank
  end

  def allergic_to?(allergen)
    (ALLERGENS[allergen.to_sym] & @rank) > 0
  end

  def list
    ALLERGENS.keys.map(&:to_s).select { |allergen| allergic_to?(allergen) }
  end
end
