import 'package:poke_api/models/name_url.dart';

class PokemonType{
	int slot;
	NameUrlClass type;

	PokemonType(){
		this.slot = 0;
		this.type = NameUrlClass();
	}

	PokemonType.fromJson(Map json):
		slot = json['slot'] as int,
		type = NameUrlClass.fromJson(json['type']);

	Map toJson(){
		return {
			'slot': this.slot,
			'type': this.type?.toJson()
		};
	}

	dynamic operator[](key){
		return this?.toJson()[key];
	}
}
