require_relative "deck"
require_relative "hand"


class Game
  attr_reader :player
  attr_accessor :player_hand, :dealer_hand, :deck, :player_score,
  :dealer_score

  def initialize(player_name)
    @deck = Deck.new
    @player = player_name
    @player_hand = Hand.new
    @dealer_hand = Hand.new
    @player_score = 0
    @dealer_score = 0
  end

  def deal
    @dealer_hand.hand << @deck.deal
    @dealer_hand.hand << @deck.deal
    @player_hand.hand << @deck.deal
    @player_hand.hand << @deck.deal
    @player_hand.hand.each do |card|
      puts "Player was dealt #{card.rank}#{card.suit}"
    end
    score
    input
  end

  def input
      print "Would you like to hit or stand?(H/S):"
      answer = gets.chomp.upcase
      until answer == "S"
        if answer != "H"
          print "Invalid answer, please re-enter (H/S):"
          answer = gets.chomp.upcase
        else
          player_hit
          if @player_score > 21
            puts "\nPlayer score: #{@player_score}\n\n"
            puts "BUST! YOU LOSE!!"
            return
          elsif @player_score == 21
            puts "BLACKJACK!!!!! YOU WIN!!!!"
          end
          puts "\nPlayer score: #{@player_score}\n\n"
          print "Hit or stand? (H/S):"
          answer = gets.chomp.upcase
        end
      end
      puts "Player stands..."
      puts "Player score: #{@player_score}\n\n"
      dealer_hit
  end

  def score
    @player_hand.hand.each do |card|
      if card.rank == "A" && @player_score >= 11
        @player_score += 1
      else
        @player_score += card.card_value
      end
    end
    puts "Player score: #{@player_score}\n\n"
    @dealer_hand.hand.each do |card|
      if card.rank == "A" && @dealer_score >= 11
        @dealer_score += 1
      else
        @dealer_score += card.card_value
      end
    end
  end

  def dealer_hit
    until @dealer_score >= 17
      @dealer_hand.hand << @deck.deal
      if @dealer_hand.hand[-1].rank == "A" && @dealer_score >= 11
        @dealer_score += 1
      else
        @dealer_score += @dealer_hand.hand[-1].card_value
      end
    end
    puts "Dealer stands..."
    puts "Dealer score: #{@dealer_score}\n\n"
    if @dealer_score > 21
      puts "DEALER BUSTS!!!... YOU WIN!!"
    elsif @dealer_score < @player_score
      puts "YOU WIN!!!"
    elsif @dealer_score > @player_score
      puts "DEALER WINS!!"
    elsif @dealer_score == @player_score
      puts "IT'S A TIE.."
    end
  end

  def player_hit
    @player_hand.hand << @deck.deal
    if @player_hand.hand[-1].rank == "A" && @player_score >= 11
      @player_score += 1
    else
      @player_score += @player_hand.hand[-1].card_value
    end
  end
end
game = Game.new("John")
game.deal
