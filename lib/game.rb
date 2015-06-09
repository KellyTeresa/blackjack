class Game
  attr_reader :deck, :player_hand, :dealer_hand

  def initialize
    @deck = Deck.new
    @player_hand = Hand.new
    @dealer_hand = Hand.new
    @playing = "no game"
  end


  def playing?
    "Currently playing #{@playing}."
  end

  def begin_blackjack!
    if @playing != "no game"
      "Game already started! #{playing?}"
    else
      puts "\nWelcome to Blackjack!\n"
      @playing = "Blackjack"
      2.times do |deal|
        player_hand.new_card!(deck)
        dealer_hand.new_card!(deck)
      end
    end
  end

  def display_player_hand
    player_hand.view.each do |card|
      puts "Player was dealt: #{card}"
    end
    puts "Player score: #{score(player_hand)}\n"
  end

  def display_dealer_hand
    puts ""
    dealer_hand.view.each do |card|
      puts "Dealer was dealt: #{card}"
    end
    puts "Dealer score: #{score(dealer_hand)}"
  end

  def point_value(card)
    if card.face_card?
      10
    elsif card.ace?
      11
    else
      card.value.to_i
    end
  end

  def score(hand)
    points = 0
    high_scored_aces = 0
    hand.held_cards.each do |card|
      high_scored_aces += 1 if card.ace?
      points += point_value(card)
    end

    while high_scored_aces >= 1 && points >= 21
      high_scored_aces -= 1
      points -= 10
    end
    points
  end

  def hit(hand)
    hand.new_card!(deck)
  end

  def prompt_hit_or_stand
    print "\nHit or stand (H/S): "
    answer = gets.chomp.downcase
    if answer == "h"
      hit(player_hand)
      puts "\nPlayer was dealt: #{player_hand.held_cards[-1].info}"
      puts "Player score: #{score(player_hand)}\n"
      if score(player_hand) > 21
        puts "Bust! Game over..."
      else
        dealer_turn
      end
    elsif answer == "s"
      puts "\nPlayer score: #{score(player_hand)}\n"
      dealer_turn
    else
      puts "Invalid input."
      prompt_hit_or_stand
    end
  end

  def dealer_turn
    display_dealer_hand
    if score(dealer_hand) >= 17
      puts "\nDealer stands.\n"
    elsif score(dealer_hand) < 17
      hit(dealer_hand)
      puts "\nDealer was dealt: #{dealer_hand.held_cards[-1].info}"
      puts "Dealer score: #{score(dealer_hand)}"
      if score(dealer_hand) > 21
        puts "\nDealer busts! You win!"
      end
    end
  end

  def compare_scores
    player_score = score(player_hand)
    dealer_score = score(dealer_hand)
    if player_score > 21 || dealer_score > 21
      puts ""
    elsif player_score == dealer_score
      puts "Tie!"
    elsif player_score > dealer_score
      puts "\nYou win!"
    elsif dealer_score > player_score
      puts "\nYou lose..."
    end
  end
end
