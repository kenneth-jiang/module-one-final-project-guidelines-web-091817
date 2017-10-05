class Type < ActiveRecord::Base

	validates_uniqueness_of :name
	has_many :pokemons_types
	has_many :pokemons, through: :pokemons_types

end
