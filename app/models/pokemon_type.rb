class PokemonsType < ActiveRecord::Base

	belongs_to :pokemons
	belongs_to :types

end