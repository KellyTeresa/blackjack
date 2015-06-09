require_relative 'playing_card_constants'

class Deck
  def initialize
    @cards = Array.new
    SUITS.each do |suit|
      VALUES.each do |value|
        @cards << Card.new(value,suit)
      end
    end
    @cards.shuffle!
  end

  def remaining_cards
    cards.count
  end

  def draw!
    cards.pop
  end

  private
  attr_reader :cards

end
