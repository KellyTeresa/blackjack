require_relative '../../lib/game'

describe Game do
  let (:game) {Game.new}
  # context 'a new game' do
  #   it 'has a deck' do
  #     expect(game.deck).to be_a Deck
  #   end
  #   it 'has a player hand and a dealer hand' do
  #     expect(game.player_hand).to be_a Hand
  #     expect(game.dealer_hand).to be_a Hand
  #   end
  #   it 'has 52 cards the deck' do
  #     expect(game.deck.remaining_cards).to eq 52
  #   end
  #   it 'has no cards in either hand' do
  #     expect(game.player_hand.size).to eq 0
  #     expect(game.dealer_hand.size).to eq 0
  #   end
  #   it 'has not started a game' do
  #     expect(game.playing?).to eq "Currently playing no game."
  #   end
  # end
  #
  # context '#begin_blackjack!' do
  #   it 'gives player two cards' do
  #     game.begin_blackjack!
  #     expect(game.player_hand.size).to eq 2
  #   end
  #   it 'gives dealer two cards' do
  #     game.begin_blackjack!
  #     expect(game.dealer_hand.size).to eq 2
  #   end
  #   it 'is playing blackjack' do
  #     game.begin_blackjack!
  #     expect(game.playing?).to eq "Currently playing Blackjack."
  #   end
  #   it 'cannot start the game twice' do
  #     game.begin_blackjack!
  #     expect(game.begin_blackjack!).to eq "Game already started! Currently playing Blackjack."
  #   end
  # end

end
