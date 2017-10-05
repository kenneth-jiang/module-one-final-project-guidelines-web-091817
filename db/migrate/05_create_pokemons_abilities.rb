class CreatePokemonsAbilities < ActiveRecord::Migration

	def change 
		create_table :pokemons_abilities do |t|
    		t.integer :pokemon_id
    		t.integer :ability_id
    	end
	end
	

end
