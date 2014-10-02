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

def player_play(mycards, deck)
  puts "Hit or Stay? (h/s)"
  if gets.chomp == 'h'
    mycards << deck.pop
  elsif gets.chomp == 's'  
  end
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
  arr.select{|e| e == "A"}.count.times do 
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

deck = suits.product(cards)
deck.shuffle!

mycards = []
dealcards = []


# Main 
puts "Welcome to Blackjack!"
puts "Enter your name:"
player_name = gets.chomp

loop do 
  # Dealer deals cards
  deck.shuffle!
  mycards << deck.pop
  dealcards << deck.pop
  mycards << deck.pop
  dealcards << deck.pop

  # Play
  loop do 
    
    # Make the board
    make_board(dealcards, player_name, mycards)
    if calculate_total(mycards) > 21
      make_board(dealcards, player_name, mycards)
      puts "Bust!"
      puts "Dealer wins!"
      break
    elsif calculate_total(dealcards) > 21
      make_board(dealcards, player_name, mycards)
      puts "Dealer Busts!"
      puts "#{player_name} wins!"
      break
    elsif calculate_total(mycards) == 21
      make_board(dealcards, player_name, mycards)
      puts "#{player_name} wins!"
      break
    elsif calculate_total(dealcards) == 21
      make_board(dealcards, player_name, mycards)
      puts "Dealer wins!"
      break
    end

    # Player plays 
    player_play(mycards, deck)
    if calculate_total(mycards) > 21
      make_board(dealcards, player_name, mycards)
      puts "Bust!"
      puts "Dealer wins!"
      break
    elsif calculate_total(dealcards) > 21
      make_board(dealcards, player_name, mycards)
      puts "Dealer Busts!"
      puts "#{player_name} wins!"
      break
    elsif calculate_total(mycards) == 21
      make_board(dealcards, player_name, mycards)
      puts "#{player_name} wins!"
      break
    elsif calculate_total(dealcards) == 21
      make_board(dealcards, player_name, mycards)
      puts "Dealer wins!"
      break
    end

    # Computer plays
    computer_play(dealcards, deck)
    if calculate_total(mycards) > 21
      make_board(dealcards, player_name, mycards) 
      puts "Bust!"
      puts "Dealer wins!"
      break
    elsif calculate_total(dealcards) > 21
      make_board(dealcards, player_name, mycards)
      puts "Dealer Busts!"
      puts "#{player_name} wins!"
      break
    elsif calculate_total(mycards) == 21
      make_board(dealcards, player_name, mycards)
      puts "#{player_name} wins!"
      break
    elsif calculate_total(dealcards) == 21
      make_board(dealcards, player_name, mycards)
      puts "Dealer wins!"
      break
    end
  end
  puts "Play again? (y/n)"
  if gets.chomp == "y"
    mycards.clear
    dealcards.clear
    next
  elsif gets.chomp == "n"
    puts "Play again soon!"
    break
  end
end



