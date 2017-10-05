class CreatePokemon < ActiveRecord::Migration[5.0]
  def change
   	create_table :pokemons do |t|
      	#primary key of :id is created for us!
	  	t.string :name
  	end
  end
end
