import 'package:poke_api/models/name_url.dart';

class Ability{
	NameUrlClass ability;
	int slot;
	bool isHidden;

	Ability(){
		this.slot = 0;
		this.isHidden = false;
		this.ability = NameUrlClass();
	}

	Ability.fromJson(Map json):
		ability = NameUrlClass.fromJson(json['ability']),
		slot = json['slot'] as int,
		isHidden = json['is_hidden'] as bool;

	Map toJson(){
		return {
			'ability': this.ability?.toJson(),
			'slot': this.slot,
			'is_hidden': this.isHidden
		};
	}

	dynamic operator[](key){
		return this.toJson()[key];
	}
}

