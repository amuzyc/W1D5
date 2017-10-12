require 'rspec'
require 'tdd'

RSpec.describe Array do
  subject(:uniq_array){[1,2,1,3,3]}
  describe "#my_uniq" do
    it "Expected returns an array of uniq characters" do
      expect(uniq_array.my_uniq).to eq([1,2,3])
    end
    it "Doesn't modify original array" do
      uniq_array.my_uniq
      expect(uniq_array).to eq([1,2,1,3,3])
    end
  end
  subject(:two_sum_array){[-1, 1, 1, 9, 8]}
  let(:zero_array){[4,0,6,7]}
  let(:two_zero_array){[4,0,0,7]}
  describe "#two_sum" do
    it "Doesn't modify original array" do
        two_sum_array.two_sum
        expect(two_sum_array).to eq([-1, 1, 1, 9, 8])
    end
    it "#two_sum returns positions of zero sum elements in correct order" do
      expect(two_sum_array.two_sum).to eq([[0, 1], [0, 2]])
    end
    it "works if a zero is in the array" do
      expect(zero_array.two_sum).to eq([])
    end
    it "works correctly with two_zeros" do
      expect(two_zero_array.two_sum).to eq([[1,2]])
    end

  end
  subject(:transpose_array){[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}
  let(:transpose_array_four){[
    [0, 1, 2, 5],
    [3, 4, 5, 6],
    [6, 7, 8, 7],
    [5, 7, 8, 9]
  ]}

  describe "#my_transpose" do
    it "transposes a 3x3 array of integers correctly" do
      expect(my_transpose(transpose_array)).to eq([
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
        ])
    end
    it "transposes square arrays of different size" do
      expect(my_transpose(transpose_array_four)).to eq([[0,3,6,5],[1,4,7,7],[2,5,8,8],[5,6,7,9]])
    end
    it "doesn't motify the original array" do
      my_transpose(transpose_array)
      expect(transpose_array).to eq([
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ])
    end

subject(:stocks){[200, 100, 300, 400, 50]}
subject(:negative_stocks){[94,84,73,71,65,43,31]}
subject(:same_stocks){[1,1,1,1,1,1,1]}
  describe "#stock_picker" do
    it "Finds the most profitable pair" do
      expect(stock_picker(stocks)).to eq([1,3])
    end
    it "First index is lower than second" do
      positions = stock_picker(stocks)
      expect(positions.first).to be < positions.last
    end
    it "Will return least negative positions" do
      expect(stock_picker(negative_stocks)).to eq([2,3])
    end
    it "Will return first two days if all stocks equal" do
      expect(stock_picker(same_stocks)).to eq([0,1])
    end
  end




  end

end
