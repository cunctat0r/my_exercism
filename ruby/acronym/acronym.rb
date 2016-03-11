#
class Acronym
  VERSION = 1
  def self.abbreviate(in_str)
    in_str
      .split(/[ -]/)
      .each_with_object([]) do |item, obj|
        obj << item[0].upcase
        unless item == item.upcase
          1.upto(item.length - 2) do |num|
            obj << item[num].upcase if item[num] == item[num].upcase
          end
        end
      end
      .join('')
  end
end
