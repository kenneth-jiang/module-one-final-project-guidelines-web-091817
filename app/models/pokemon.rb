class Pokemon < ActiveRecord::Base

	validates_uniqueness_of :name
	has_many :pokemons_abilities
	has_many :pokemons_types
	has_many :abilities, through: :pokemons_abilities
	has_many :types, through: :pokemons_types

	#attr_accessor :name
	# @@all = []
	# def initialize
	# 	@@all << self
	# end

	# def self.all
	# 	@@all
	# end
	

end
