import 'package:poke_api/models/name_url.dart';

class Ability{
	AbilityDetail ability;
	int slot;
	bool is_hidden;

	Ability(){
		this.slot = 0;
		this.is_hidden = false;
		this.ability = AbilityDetail();
	}

	Ability.fromJson(Map json):
		ability = AbilityDetail.fromJson(json['ability']),
		slot = json['slot'] as int,
		is_hidden = json['is_hidden'] as bool;

	Map toJson(){
		return {
			'ability': this.ability.toJson(),
			'slot': this.slot,
			'is_hidden': this.is_hidden
		};
	}

	dynamic operator[](key){
		if(key == 'slot'){
			return this.slot;
		} else if(key == 'is_hidden'){
			return this.is_hidden;
		} else if(key == 'ability'){
			return this.ability;
		}
	}
}

class AbilityDetail extends NameUrlClass{}
