class Adapter

	def get_pokemons_from_api 
  		url = 'https://pokeapi.co/api/v2/pokemon/'
	  while url != nil
	    all_pokemons = RestClient.get(url)
	    pokemon_hash = JSON.parse(all_pokemons)
	    pokemon_hash["results"].each do |hash|
	      Pokemon.find_or_create_by(name: hash["name"])
	    end
	    url = pokemon_hash["next"]
	  end
	  return nil
	end

	def get_abilities_from_api
	  url = 'https://pokeapi.co/api/v2/ability/'
	  while url != nil
	    all_abilities = RestClient.get(url)
	    abilities_hash = JSON.parse(all_abilities)
	    abilities_hash["results"].each do |hash|
	      Ability.find_or_create_by(name: hash["name"])
	    end
	    url = abilities_hash["next"]
	  end
	  return nil
	end

	def get_types_from_api
	  url = 'https://pokeapi.co/api/v2/type/'
	  while url != nil
	    all_types = RestClient.get(url)
	    types_
	    hash = JSON.parse(all_types)
	    types_hash["results"].each do |hash|
	      Type.find_or_create_by(name: hash["name"])
	    end
	    url = types_hash["next"]
	  end
	  return nil
	end


	def get_pokemons_abilities_types
	  count = 1
	  while count <= 721
	    url = "https://pokeapi.co/api/v2/pokemon/#{count}"
	    abilities = RestClient.get(url)
	    myHash = JSON.parse(abilities)
	    myHash["abilities"].each do |hash|
	      ability_obj = Ability.find_by(name: hash["ability"]["name"])
	      PokemonsAbility.find_or_create_by(pokemon_id: count, ability_id: ability_obj.id)
	    end
	    myHash["types"].each do |hash|
	        type_obj = Type.find_by(name: hash["type"]["name"])
	        PokemonsType.find_or_create_by(pokemon_id: count, type_id: type_obj.id)
	    end
	    count += 1
	  end
	end
end
