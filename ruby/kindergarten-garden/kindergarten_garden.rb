#
class Garden
  CHILDREN = %w(Alice
                Bob
                Charlie
                David
                Eve
                Fred
                Ginny
                Harriet
                Ileana
                Joseph
                Kincaid
                Larry).freeze
  PLANTS = {
    'G' => 'grass',
    'C' => 'clover',
    'R' => 'radishes',
    'V' => 'violets'
  }.freeze

  def initialize(diaram, students = nil)
    @plant_arr = diaram.split("\n")
    @students = students || CHILDREN
  end

  def method_missing(name)
    child = name.id2name.capitalize
    get_plants(child)
  end

  private

  def get_plants(child)
    child_position = @students.sort.index(child)
    @plant_arr
      .each_with_object('') { |row, child_plants| child_plants << row[2 * child_position, 2] }
      .chars.each_with_object([]) { |char, plants_arr| plants_arr << PLANTS[char].to_sym }
  end
end
