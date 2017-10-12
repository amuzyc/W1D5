SUITS = [:spade, :heart, :club, :diamond]
VALUES = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']

class Card



  attr_accessor :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def ==(card)
    self.value == card.value && self.suit == card.suit
  end

end
