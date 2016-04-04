class BinarySearch
  attr_reader :list, :middle

  def initialize(list)
    raise ArgumentError unless list == list.sort
    @list = list
    @middle = @list.length / 2
  end

  def search_for(element)
    raise RuntimeError unless @list.include?(element)
    start_pos = 0
    end_pos = @list.length

    while true do
      middle = (start_pos + end_pos) / 2
      if element > @list[middle]
        start_pos = middle
      elsif element < @list[middle]
        end_pos = middle
      else
        return middle
      end
    end    
  end
end