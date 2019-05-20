import 'package:poke_api/models/name_url.dart';

class PokemonType{
	int slot;
	PokemonTypeDetail type;

	PokemonType(){
		this.slot = 0;
		this.type = PokemonTypeDetail();
	}

	PokemonType.fromJson(Map json):
		slot = json['slot'] as int,
		type = PokemonTypeDetail.fromJson(json['type']);

	Map toJson(){
		return {
			'slot': this.slot,
			'type': this.type.toJson()
		};
	}

	dynamic operator[](key){
		if(key == 'slot'){
			return this.slot;
		} else if(key == 'type'){
			return this.type;
		}
	}
}

class PokemonTypeDetail extends NameUrlClass{}
