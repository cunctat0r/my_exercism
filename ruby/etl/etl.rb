#
class ETL
  def self.transform(input)
    result = {}
    input.each do |key, value|
      value.each do |val|
        result[val.downcase] = key
      end
    end
    result
  end
end
