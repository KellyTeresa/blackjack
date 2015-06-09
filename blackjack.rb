#!/usr/bin/env ruby
Dir[File.join('lib', '**', '*.rb')].each do |file|
  require_relative file
end

def play_new
  blackjack = Game.new
  blackjack.begin_blackjack!
  blackjack.display_player_hand
  blackjack.prompt_hit_or_stand
  blackjack.compare_scores
  play_again?
end

def play_again?
  print "Play again? (Y/N): "
  answer = gets.chomp.downcase
    if answer == "y"
      play_new
    elsif answer == "n"
      puts "Ok, goodbye!"
    else
      puts "Invalid input. \n"
      play_again?
    end
end

play_new
