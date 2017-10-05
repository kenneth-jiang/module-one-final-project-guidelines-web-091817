class Ability < ActiveRecord::Base
		
	validates_uniqueness_of :name
	has_many :pokemons_abilities
	has_many :pokemons, through: :pokemons_abilities





	
end
