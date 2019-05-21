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
	int baseExperience;
	int height;
	int width;
	String name;
	String url;
	String image;
	String locationAreaEncounters;
	bool isDefault;
	List<Ability> abilities;
	List<PokemonForm> forms;
	List<GameIndices> gameIndices;
	List heldItems;
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
		baseExperience = json['base_experience'] as int,
		height = json['height'] as int,
		width = json['width'] as int,
		name = json['name'],
		image = json['sprites'] != null ? json['sprites']['front_default'] : null,
		url = json['url'],
		locationAreaEncounters = json['location_area_encounters'],
		isDefault = json['is_default'] as bool,
		abilities = (json['abilities'] as List).map((d)=>Ability.fromJson(d)).toList(),
		forms = (json['forms'] as List).map((d)=>PokemonForm.fromJson(d)).toList(),
		gameIndices = (json['game_indices'] as List).map((d)=>GameIndices.fromJson(d)).toList(),
		heldItems = json['held_items'] as List,
		moves = (json['moves'] as List).map((d)=>PokemonMove.fromJson(d)).toList(),
		stats = (json['stats'] as List).map((d)=>PokemonStat.fromJson(d)).toList(),
		types = (json['types'] as List).map((d)=>PokemonType.fromJson(d)).toList(),
		species = NameUrlClass.fromJson(json['species']),
		sprites = json['sprites'] as Map;

	Map toJson(){
		return {
      'id': this.id,
      'order': this.order,
      'base_experience': this.baseExperience,
      'height': this.height,
      'width': this.width,
			'name': this.name,
			'url': this.url,
      'location_area_encounters': this.locationAreaEncounters,
      'is_default': this.isDefault,
      'abilites': this.abilities.map((d)=>d.toJson()).toList(),
      'forms': this.forms.map((d)=>d.toJson()).toList(),
      'game_indices': this.gameIndices.map((d)=>d.toJson()).toList(),
      'held_items': this.heldItems,
      'moves': this.moves.map((d)=>d.toJson()).toList(),
      'stats': this.stats.map((d)=>d.toJson()).toList(),
      'moves': this.moves.map((d)=>d.toJson()).toList(),
      'species': this.species.toJson(),
      'sprites': this.sprites
		};
	}

	dynamic operator[](key){
		return this.toJson()[key];
	}
}
