require_relative '../PolyTreeNode/lib/00_tree_node.rb'

class KnightPathFinder
  def initialize(starting_position)
    @starting_position = starting_position
  end

 def self.new_moves(starting_position)
   results=[]
   sigmas=[[1,2],[2,1],[-1,-2],[-2,-1],[-1,2],[2,-1],[1,-2],[-2,1]]
   sigmas.each do |sigma|
     new_pos=[starting_position[0]+sigma[0], starting_position[1]+sigma[1]]
     if new_pos[0] >= 0 && new_pos[0]<8 && new_pos[1]>=0 && new_pos[1]<8
       results << new_pos
     end
   end
   results
 end

 def build_move_tree
   root = PolyTreeNode.new(@starting_position)
   q = [root]
   visited_pos = []
   until q.empty?
     curr = q.shift
     if !visited_pos.include?(curr.value)
       visited_pos << curr.value
       KnightPathFinder.new_moves(curr.value).each do |move|
         node = PolyTreeNode.new(move)
         curr.add_child(node)
         q << node
       end
     end
   end
   root
 end



end
