import 'package:poke_api/models/name_url.dart';

class PokemonMove{
	PokemonMoveDetail move;
	PokemonMoveVersionGroupDetail version_group_details;

	PokemonMove(){
		this.move = PokemonMoveDetail();
		this.version_group_details = PokemonMoveVersionGroupDetail();
	}

	PokemonMove.fromJson(Map json):
		move = PokemonMoveDetail.fromJson(json['move']),
		version_group_details = PokemonMoveVersionGroupDetail.fromJson(json['version_group_details']);

	Map toJson(){
		return {
			'move': this.move.toJson(),
			'version_group_details': this.version_group_details.toJson()
		};
	}

	dynamic operator[](key){
		if(key == 'move'){
			return this.move;
		} else if(key == 'version_group_details'){
			return this.version_group_details;
		}
	}
}

class PokemonMoveDetail extends NameUrlClass{}

class PokemonMoveVersionGroupDetail{
	int level_learned_at;
	PokemonMoveLearnMethod move_learn_method;
	PokemonMoveVersionGroup version_group;

	PokemonMoveVersionGroupDetail(){
		this.level_learned_at = 0;
		this.move_learn_method = PokemonMoveLearnMethod();
		this.version_group = PokemonMoveVersionGroup();
	}

	PokemonMoveVersionGroupDetail.fromJson(Map json):
		level_learned_at = json['level_learned_at'] as int,
		move_learn_method = PokemonMoveLearnMethod.fromJson(json['move_learn_method']),
		version_group = PokemonMoveVersionGroup.fromJson(json['version_group']);

	Map toJson(){
		return {
			'level_learned_at': this.level_learned_at,
			'move_learn_method': this.move_learn_method.toJson(),
			'version_group': this.version_group.toJson()
		};
	}

	dynamic operator[](key){
		if(key == 'level_learned_at'){
			return this.level_learned_at;
		} else if(key == 'move_learn_method'){
			return this.move_learn_method;
		} else if(key == 'version_group'){
			return this.version_group;
		}
	}
}

class PokemonMoveLearnMethod extends NameUrlClass{}

class PokemonMoveVersionGroup extends NameUrlClass{}
