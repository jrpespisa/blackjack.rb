require_relative '../../lib/card.rb'

describe Card do
  let(:card) {Card.new("8","♦")}
  describe "#new" do
    it "assigns a rank to the card" do
      card

      expect(card.rank).to eq("8")
    end

    it "assigns a suit to the card" do
      card

      expect(card.suit).to eq("♦")
    end
  end

  describe "#card_value" do
    it "assigns value to the card if the card has a rank of a number" do
      card.card_value

      expect(card.value).to eq(8)
    end

    it "assigns value to the card if the card has a face value" do
      card = Card.new("J", "♦")
      card.card_value

      expect(card.value).to eq(10)
    end

    it "assigns a value to the card if the card is an ace" do
    card = Card.new("A", "♦")
    card.card_value

    expect(card.value).to eq(11)
    end
  end
end
