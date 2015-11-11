require_relative 'deck'

class Card
  attr_reader :rank, :suit
  attr_accessor :value, :ace_count

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def card_value
    @value = 0
    if @rank =~ /[JKQ]/
      @value = 10
    elsif @rank =~ /[A]/
      @value = 11
    else
      @value = @rank.to_i
    end
  end
end
