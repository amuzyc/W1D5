class PolyTreeNode
  attr_accessor :value, :parent, :children

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(node)
    handle_old_parent
    @parent = node
    return if node==nil
    node.children << self unless node.children.include?(self)
  end

  def handle_old_parent
    return if self.parent==nil
    old_parent = self.parent
    old_parent.children.delete(self)
  end

  def add_child(node)
    node.parent=(self)
  end

  def remove_child(node)
    raise "Node not a child" if !@children.include?(node)
    node.parent=nil
  end

  def dfs(target_value)
    return self if target_value == self.value
    @children.each do |child|
      res = child.dfs(target_value)
      return res if !res.nil?
    end
    nil
  end

  def bfs(target_value)
    q=[self]
    until q.empty? do
      curr = q.shift
      return curr if curr.value == target_value
      curr.children.each do |child|
        q << child
      end
    end

  end


end
