def make_board(dealcards, player_name, mycards)
  system 'clear'
  puts "====================================="
  puts "|| Dealer ||"
  puts "-------------------------------------"
  say_cards(dealcards)
  puts "Total: #{calculate_total(dealcards)}"
  puts "====================================="
  puts "|| #{player_name} ||"
  puts "-------------------------------------"
  say_cards(mycards)
  puts "Total: #{calculate_total(mycards)}"
  puts "====================================="
end

def computer_play(dealcards, deck)
  if calculate_total(dealcards) < 17
    dealcards << deck.pop
  end
end

def calculate_total(deck)
  arr = deck.map{|e| e[1]}
  total = 0
  arr.each do |value|
    if value == 'Ace'
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end 
  end
  # Correct for Aces
  arr.select{|e| e == "Ace"}.count.times do 
    if total > 21
      total -= 10
    end
  end
  total
end

def say_cards(deck)
  deck.each do |array|
    puts "#{array.last} of #{array.first}"
  end
end

suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']

# Welcome

puts "Welcome to Blackjack!"
puts "Enter your name:"
player_name = gets.chomp

# Deal Cards

deck = suits.product(cards)
deck.shuffle!
mycards = []
dealcards = []

mycards << deck.pop
dealcards << deck.pop
mycards << deck.pop
dealcards << deck.pop

# Show Cards

make_board(dealcards, player_name, mycards)

# Winner from beginning? 

if calculate_total(mycards) == 21
  puts "Congratulations, you hit blackjack! You win!"
end

if calculate_total(dealcards) == 21
  puts "Sorry, dealer hit blackjack. You lose."
  exit
end

# Player plays

while calculate_total(mycards) < 21
  make_board(dealcards, player_name, mycards)
  puts "What would you like to do? Hit or stay? (h/s)"
  hit_or_stay = gets.chomp
  
  if !['h', 's'].include?(hit_or_stay)
    next
  end

  if hit_or_stay == "s"
    puts "You chose to stay."
    break
  end

  if hit_or_stay == "h"
    new_card = deck.pop
    mycards << new_card
    make_board(dealcards, player_name, mycards)
  end
  
  if calculate_total(mycards) == 21
    puts "Congratulations, you hit blackjack! You win!"
    exit
  elsif calculate_total(mycards) > 21
    puts "Sorry, it looks like you busted! You lose."
    exit
  end
end 

# Dealer Plays

while calculate_total(dealcards) < 17
  new_card = deck.pop
  dealcards << new_card
  make_board(dealcards, player_name, mycards)
  if calculate_total(dealcards) == 21
    puts "Sorry, dealer hit blackjack. You lose."
    exit
  elsif calculate_total(dealcards) > 21
    puts "Congratulations, dealer busted! You win!"
    exit
  end 
end

# Compare hands

make_board(dealcards, player_name, mycards)
if calculate_total(dealcards) > calculate_total(mycards)
  puts "Sorry, dealer wins."
  exit
elsif calculate_total(dealcards) < calculate_total(mycards)
  puts "Congrautulations! You win!"
  exit
else
  puts "It's a tie!"
  exit
end

# Play again?

# puts "Play again? (y/n)"
# play_again = gets.chomp
# if play_again == "y"
#   next
# elsif play_again == "n"
#   puts "See you soon!"
#   exit
# end
    



