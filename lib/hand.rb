require_relative "deck"
require 'pry'

class Hand
  attr_accessor :hand

  def initialize
    @hand = []
  end
end
