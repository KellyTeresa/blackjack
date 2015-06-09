class Hand
  attr_reader :held_cards
  def initialize
    @held_cards = []
  end

  def size
    held_cards.count
  end

  def new_card!(deck_to_draw)
    held_cards << deck_to_draw.draw!
  end

  def view
    if size == 0
      "No cards!"
    else
      cards_info = []
      held_cards.each do |card|
        cards_info << card.info
      end
      cards_info
    end
  end

end
