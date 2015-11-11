require_relative '../../lib/hand.rb'

describe Hand do
  let(:hand) {Hand.new}
  describe "#new" do
    it "creates a hand as an empty array" do
      game = Game.new("John")

      expect(hand.hand).to eq([])
    end
  end
end
