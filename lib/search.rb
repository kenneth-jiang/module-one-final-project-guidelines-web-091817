class Search

    def self.search_pokemon
      
      pokemon_str = gets.chomp.downcase
      pokemon_exists = Pokemon.exists?(name: pokemon_str)
      if pokemon_exists
        pokemon_obj = Pokemon.find_by(name: pokemon_str)
        pokemon_id = pokemon_obj.id

        option = 0
        while option != 'q'

          self.pokemon_intro
          option = gets.chomp.downcase
          clear

          if option == '1' ####### list abilities of pokemon
            self.find_abilities(pokemon_id)

          elsif option == '2' ####### list types of pokemon
            self.find_types(pokemon_id)

          elsif option != 'q'
            invalid_input
          end
        end
      else
        clear
        invalid_input
      end
    end

#####################################################

  def self.search_type
    
    type_input = gets.chomp.downcase
    type_exists = Type.exists?(name: type_input)
    if type_exists
      type_obj = Type.find_by(name: type_input)
      type_id = type_obj.id
      types_id = PokemonsType.where(type_id: type_id)
      self.parse_pokemon_obj(types_id)
    else
      invalid_input
    end
  end

#####################################################

  def self.search_ability

    ability_input = gets.chomp.downcase
    ability_exists = Ability.exists?(name: ability_input)
    if ability_exists
      ability_obj = Ability.find_by(name: ability_input)
      ability_id = ability_obj.id
      abilities_id = PokemonsAbility.where(ability_id: ability_id)
      self.parse_pokemon_obj(abilities_id)
    else
      invalid_input
    end
  end

  #####################################################

  def self.pokemon_intro
    puts ""
    puts "------------------------"
    puts "1. Search for abilities."
    puts "------------------------"
    puts "2. Search for types."
    puts "------------------------"
    puts "Type Q to go back."
    puts "------------------------"
  end

  #####################################################

  def self.print_output(array)
    puts ""
    puts array
  end

#####################################################

  def self.parse_pokemon_obj(obj)
    pokemons_obj = obj.map do |s|
        s.pokemon_id
      end
      pokemon_obj = pokemons_obj.map do |s|
        Pokemon.where(id: s)
      end
      self.list_pokemons(pokemon_obj)
  end

#####################################################

  def self.list_pokemons(pokemon_obj)
    count = 1
      pokemon_names = []
      pokemon_obj.each do |pokemon, elem|
        pokemon_names << "#{count}. #{pokemon.name.capitalize}"
        count += 1
      end
      self.print_output(pokemon_names)
  end

#####################################################

  def self.list_type_ability(arg)
    array = []
    count = 1
    arg.each do |s|
      array << "#{count}. #{s.name.capitalize}"
      count += 1
    end
    self.print_output(array)
  end 

#####################################################

  def self.find_abilities(pokemon_id)
    abilities_id = PokemonsAbility.where(pokemon_id: pokemon_id)
    ability_id = abilities_id.map do |s|
      s.ability_id
    end
    abilities = Ability.where(id: ability_id)
    self.list_type_ability(abilities)
  end

#####################################################

  def self.find_types(pokemon_id)
    types_id = PokemonsType.where(pokemon_id: pokemon_id)
    type_id = types_id.map do |s|
      s.type_id
    end
    types = Type.where(id: type_id)
    self.list_type_ability(types)
  end
end

#####################################################
def clear
  puts `clear`
end
#####################################################
def invalid_input 
  puts "Invalid input, please try again."
end
#####################################################


