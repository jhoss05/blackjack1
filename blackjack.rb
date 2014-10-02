def make_board
  system 'clear'
  puts "====================================="
  puts "|| Dealer ||"
  puts "-------------------------------------"
  puts dealcards
  puts "====================================="
  puts "|| #{player_name}||"
  puts "-------------------------------------"
  puts mycards
  puts "====================================="
end

suits = ['H', 'D', 'S', 'C']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suits.product(cards)
deck.shuffle!

mycards = []
dealcards = []


# Main 

puts "Welcome to Blackjack!"
puts "Enter your name:"
player_name = gets.chomp

deck.shuffle!
mycards << deck.pop
dealcards << deck.pop
mycards << deck.pop
dealcards << deck.pop
make_board


