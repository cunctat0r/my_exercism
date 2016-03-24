#
class House
  ACTIONS = {
    malt: ['', 'lay'],
    rat: ['', 'ate'],
    cat: ['', 'killed'],
    dog: ['', 'worried'],
    cow: [' with the crumpled horn', 'tossed'],
    maiden: [' all forlorn', 'milked'],
    man: [' all tattered and torn', 'kissed'],
    priest: [' all shaven and shorn', 'married'],
    rooster: [' that crowed in the morn', 'woke'],
    farmer: [' sowing his corn', 'kept'],
    horse: [' and the hound and the horn', 'belonged to']
  }.freeze
  PERSONAS = ACTIONS.keys

  def self.recite
    str = "This is the house that Jack built.\n\n"
    PERSONAS.each do |person|
      str += "This is the #{self.verse(person)}\n"
    end
    "#{str.strip}\n"
  end

  def self.verse(person)
    the_index = PERSONAS.index(person)
    if the_index == 0
      return "#{person}#{ACTIONS[person][0]}\nthat #{ACTIONS[person][1]} in the house that Jack built.\n"
    end
    "#{person}#{ACTIONS[person][0]}\nthat #{ACTIONS[person][1]} the #{self.verse(PERSONAS[the_index - 1])}"
  end
end
