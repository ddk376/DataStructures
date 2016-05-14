class PolyTreeNode
  attr_accessor :parent, :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)
    if new_parent == nil
      @parent = nil
    else
      if !new_parent.children.include?(self)
        parent.children.delete(self) if parent != nil
        @parent = new_parent
        new_parent.children << self
      end
    end
  end

  def add_child(new_child)
    new_child.parent = self
  end

  def remove_child(old_child)
    if self.children.include?(old_child)
      old_child.parent = nil
    else
      raise "Not a child"
    end
  end

  def dfs(target_value)
    return self if self.value == target_value
      self.children.each do |child|
        output = child.dfs(target_value)
        return output if output != nil
      end
    nil
  end

  def bfs(target_value)
    que = [self]
    until que.empty?
      node = que.shift
      return node if node.value == target_value
      que += node.children
    end
    nil
  end

  def trace_path_back(node)
    path = []
    until node.parent == nil
      path << node.value
      node = node.parent
    end
    path << node.value
    path.reverse
  end
end
