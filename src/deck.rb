require_relative 'card'

class Deck
  SHAPES = ['circle', 'triangle', 'square']
  COLORS = ['red', 'green', 'blue']
  NUMBERS = [1, 2, 3]
  SHADINGS = ['solid', 'striped', 'empty']

  def initialize
    @cards = SHAPES.product(COLORS, NUMBERS, SHADINGS).map do |attrs|
      Card.new(*attrs)
    end
    @cards.shuffle!
  end

  def deal(num)
    @cards.shift(num)
  end

  def empty?
    @cards.empty?
  end
end
