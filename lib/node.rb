class Node
  attr_accessor :data, :children

  def initialize(value, children = [])
    @data = value
    @children = children
  end

  def add_children(array)
    @children = array
    array
  end

  def remove_children(array)
    duplicate = array.dup
    duplicate.length.times do
      if @children.include?(duplicate.first)
        @children.delete(duplicate.first)
        duplicate.shift
      end
    end
    array
  end

  def leaf_node?
    self.children == []
  end

  def sibling_values
    result = []
    @children.each do |child|
      result << child.data
    end
    result
  end

end
