require 'rspec'
require 'card'
require 'deck'

SUITS = [:spade, :heart, :club, :diamond]
VALUES = ['A','K','Q','J','2','3','4','5','6','7','8','9','10']

RSpec.describe Card do
  subject(:card) { Card.new('A', :spade) }
  describe "#initialize" do
    it "Card value should be a character" do
      expect(card.value).to be_a(String)
    end
    it "Card suit should be one of four suits" do
      expect(SUITS).to include(card.suit)
    end




  end
end

RSpec.describe Deck do
  subject(:deck){ Deck.new }
  describe "#initialize" do
    it "Creates array containing Card Objects" do
      expect(deck.cards).to all(be_a(Card))
    end
    it "Array is 52 cards" do
      expect(deck.cards.count).to eq(52)
    end
    it "Deck has 4 of each card" do
      count_hash = Hash.new(0)
      deck.cards.each do |card|
        count_hash[card.value] += 1
      end
      p count_hash
      expect(count_hash.values.all? {|value| value == 4}).to be(true)
    end
  end
  describe "#shuffle" do
    it "Shuffles cards randomly" do
      pre_shuffle = deck.cards.dup
      deck.shuffle
      expect(deck.cards).not_to be(pre_shuffle)
    end
  end

end
