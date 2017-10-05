require_relative './search.rb'

class CLI

  def start_program
    clear
    puts "Welcome to the Pokedex!"
    sleep(1)

    option = nil
    while option != 'q'
      intro
      option = gets.chomp.downcase
      case option 
      when '1'
        search_pokemon
      when '2'
        search_type
      when '3'
        search_ability
      when 'q'
        shut_down
      else
        invalid_input
      end
    end
  end

  def intro
    puts ""
    puts "---------------------------"
    puts "1. Search for a Pokemon."
    puts "---------------------------"
    puts "2. Search for a Type."
    puts "---------------------------"
    puts "3. Search for a Ability."
    puts "---------------------------"
    puts "Type Q to exit the Pokedex."
    puts "---------------------------"  
  end

  def shut_down
    puts ""
    puts "Shutting down the Pokedex..."
    puts ""
    sleep(1)
  end

  def invalid_input
    clear
    puts "Invalid input, please try again."
  end

  


end

