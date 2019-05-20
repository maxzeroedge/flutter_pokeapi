import 'package:poke_api/models/pokemon/ability.dart';
import 'package:poke_api/models/pokemon/pokemon_form.dart';
import 'package:poke_api/models/pokemon/game_indices.dart';
import 'package:poke_api/models/pokemon/pokemon_move.dart';
import 'package:poke_api/models/pokemon/pokemon_stat.dart';
import 'package:poke_api/models/pokemon/pokemon_type.dart';
import 'package:poke_api/models/name_url.dart';


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
	List<PokemonStat> stats;
	List<PokemonType> types;
	NameUrlClass species;
	Map<String, String> sprites;

	Pokemon(){
		this.name = '';
		this.url = '';
	}

	Pokemon.fromJson(Map json):
		id = json['id'] as int,
		order = json['order'] as int,
		base_experience = json['base_experience'] as int,
		height = json['height'] as int,
		width = json['width'] as int,
		name = json['name'],
		image = json['sprites'] != null ? json['sprites']['front_default'] : null,
		url = json['url'],
		location_area_encounters = json['location_area_encounters'],
		is_default = json['is_default'] as bool,
		abilities = (json['abilities'] as List).map((d)=>Ability.fromJson(d)),
		forms = (json['forms'] as List).map((d)=>PokemonForm.fromJson(d)),
		game_indices = (json['game_indices'] as List).map((d)=>GameIndices.fromJson(d)),
		held_items = json['held_items'] as List,
		moves = (json['moves'] as List).map((d)=>PokemonMove.fromJson(d)),
		stats = (json['stats'] as List).map((d)=>PokemonStat.fromJson(d)),
		types = (json['types'] as List).map((d)=>PokemonType.fromJson(d)),
		species = NameUrlClass.fromJson(json['species']),
		sprites = json['sprites'] as Map);

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
