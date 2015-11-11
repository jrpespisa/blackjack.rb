require_relative '../../lib/blackjack.rb'

describe Game do
  let(:game) {Game.new("John")}
  describe "#initialze" do
    it "initializes a game taking in a player name" do
      game

      expect(game.player).to eq("John")
    end

    it "initializes a deck for the game" do
      game

      expect(game.deck).not_to eq(nil)
    end

    it "initializes player and dealer hands" do
      game

      expect(game.dealer_hand.hand).to eq([])
      expect(game.player_hand.hand).to eq([])
    end
  end

  describe "#deal" do
    context "deal" do
      it "deals out 2 cards to the player and the dealer" do
        game.deal

        expect(game.player_hand.hand.size).to eq(2)
        expect(game.dealer_hand.hand.size).to eq(2)
      end
    end
  end

  describe "#score" do
    it "displays player score based on current card values" do
      game.player_hand.hand = [Card.new("A", "♣"), Card.new("J", "♣")]
      game.score

      expect(game.player_score).to eq(21)
    end

    it "if score is greater than 11 and an ace is present, sets value of ace to 1" do
      game.player_hand.hand = [Card.new("A", "♣"), Card.new("A", "♣"), Card.new("A", "♣")]
      game.score

      expect(game.player_score).to eq(13)
    end
  end

  describe "#hit" do
    it "adds one card to the player's hand" do
      game.deal
      game.player_hand.hand = [Card.new("A", "♣"), Card.new("J", "♣")]
      game.score
      game.player_hit

      expect(game.player_hand.hand.size).to eq(3)
    end
  end
end
