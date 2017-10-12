class Towers

  attr_accessor :board
  
  def self.populated_board
    board = [[4,3,2,1],[],[]]
    board
  end

  def initialize
    @board = Towers.populated_board
  end

end
