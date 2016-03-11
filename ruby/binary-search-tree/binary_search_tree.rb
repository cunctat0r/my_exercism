# I googled this solution :()
class Bst
  attr_accessor :data, :left, :right

  def initialize(num)
    @data = num
  end

  def insert(data)
    if @data < data
      if @right.nil?
        @right = Bst.new(data)
      else
        @right.insert(data)
      end
    else
      if @left.nil?
        @left = Bst.new(data)
      else
        @left.insert(data)
      end
    end
  end

  def each(&blk)
    Bst.traverse_preorder(self, &blk)
  end

  def self.traverse_preorder(node, &blk)
    return unless node
    traverse_preorder(node.left, &blk)
    blk.call(node.data)
    traverse_preorder(node.right, &blk)
  end
end
