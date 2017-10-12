require "rspec"
require "towers_of_hanoi"

RSpec.describe "Towers of Hanoi" do
  subject(:game) { Towers.new }
  describe "#initialize" do
    it "Intialized board is an array of arrays" do
      expect(game.board).to include([])
    end
    it "First array has all the pieces" do
      expect(game.board.first.length).to eq(4)
      expect(game.board[1..-1]).to all( be_empty )
    end
    it "Pieces are in the correct order" do
      expect(game.board.first).to eq([4,3,2,1])
    end
  end

  describe "#move" do
    it "Should not allow the player to take from an empty array"
      expect(game.move(1,2)).to raise_error

end
