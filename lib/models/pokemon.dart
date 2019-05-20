import 'package:poke_api/models/pokemon/ability.dart';
import 'package:poke_api/models/pokemon/pokemon_form.dart';
import 'package:poke_api/models/pokemon/game_indices.dart';
import 'package:poke_api/models/pokemon/pokemon_move.dart';

class Pokemon{
	int id;
	int order;
	int base_experience;
	int height;
	int width;
	String name;
	String url;
	String image;
	String location_area_encounters;
	bool is_default;
	List<Ability> abilities;
	List<PokemonForm> forms;
	List<GameIndices> game_indices;
	List held_items;
	List<PokemonMove> moves;
	List stats;
	List types;
	dynamic species;
	dynamic sprites;

	Pokemon(){
		this.name = '';
		this.url = '';
	}

	Pokemon.fromJson(Map json):
		name = json['name'],
		image = json['sprites'] != null ? json['sprites']['front_default'] : null,
		url = json['url'];

	Map toJson(){
		return {
			'name': this.name,
			'url': this.url
		};
	}

	dynamic operator[](key){
		if(key == 'name'){
			return this.name;
		}
		else if(key == 'image'){
			return this.image;
		} else if(key == 'url'){
			return this.url;
		}
	}
}
