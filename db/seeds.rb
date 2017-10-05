require_relative '../app/models/pokemon.rb'
require_relative '../app/models/type.rb'
require_relative '../app/models/ability.rb'
require_relative '../app/models/pokemon_ability.rb'
require_relative '../app/models/pokemon_type.rb'
require_relative '../lib/adapter.rb'
require 'pry'

adapter = Adapter.new
adapter.get_pokemons_from_api
adapter.get_abilities_from_api
adapter.get_types_from_api
adapter.get_pokemons_abilities_types
