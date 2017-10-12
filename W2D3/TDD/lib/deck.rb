require_relative 'card'

class Deck


  attr_accessor :cards

  def initialize
    @cards = Deck.populate_deck

  end

  def self.populate_deck
    deck = []
    VALUES.each do |value|
      SUITS.each do |suit|
        deck << Card.new(value, suit)
      end
    end
    deck
  end

  def shuffle
    @cards.shuffle!
  end



end
