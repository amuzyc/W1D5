

class Hand

  def initialize
    @cards = []
    #array of card objects
  end





  def is_flush?
    first_suit = cards.first.suit
    @cards.all? {|card| card.suit == first_suit}
  end

  def is_straight?
    card_indexes = []
    @cards.each do |card|
      card_indexes << VALUES.index(card.value)
    end
    card_indexes.sort == [card_indexes.first..card_indexes.last]
  end

  def is_straight_flush?
    self.is_flush? && self.is_straight?
  end

  def is_four_kind?
    @cards.each_with_object(Hash.new(0)) { |card,counts| counts[card.value] += 1 }
    counts.has_value?(4)
  end

  def is_three_kind?
    @cards.each_with_object(Hash.new(0)) { |card,counts| counts[card.value] += 1 }
    counts.has_value?(3)
  end

  def pair?
    @cards.each_with_object(Hash.new(0)) { |card,counts| counts[card.value] += 1 }
    counts.has_value?(2)
  end

  def high_card
    @cards.sort_by {|card| VALUES.index(card.value)}.last
  end

  def two_pair?
    @cards.each_with_object(Hash.new(0)) { |card,counts| counts[card.value] += 1 }
    array_values = counts.values.select {|value| value == 2 }
    array_values.count == 2
  end

  def full_house?
    @cards.each_with_object(Hash.new(0)) { |card,counts| counts[card.value] += 1 }
    counts.has_value?(2) && counts.has_value(3)
  end







end
