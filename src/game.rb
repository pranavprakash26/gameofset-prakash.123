require_relative 'deck'

class Game
  def initialize
    @deck = Deck.new
    @cards_in_play = @deck.deal(12)
    @score = 0
  end

  def play
    loop do
      display_cards
      puts "Enter the indexes of the 3 cards you think form a set (comma separated):"
      indices = gets.chomp.split(',').map(&:to_i)
      selected_cards = indices.map { |i| @cards_in_play[i] }

      if valid_set?(selected_cards)
        puts "Valid set! :)"
        @score += 1
        @cards_in_play = @cards_in_play - selected_cards + @deck.deal(3)
      else
        puts "Invalid set. Try again :("
      end

      break if @deck.empty? || @cards_in_play.size < 12
    end

    puts "Game over! Final score: #{@score}"
  end

  def display_cards
    @cards_in_play.each_with_index do |card, index|
      puts "#{index}: #{card}"
    end
  end

  def valid_set?(cards)
    # Convert the selected cards into an array of their attributes
    attributes = cards.map { |card| [card.shape, card.color, card.number, card.shading] }
  
    # Now use transpose to group attributes by type (all shapes together, all colors together, etc.)
    attributes.transpose.all? do |attrs|
      # Check if all attributes are the same or all different
      attrs.uniq.length == 1 || attrs.uniq.length == 3
    end
  end  
end
