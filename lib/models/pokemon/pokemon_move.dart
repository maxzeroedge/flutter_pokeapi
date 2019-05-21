import 'package:poke_api/models/name_url.dart';

class PokemonMove{
	NameUrlClass move;
	NameUrlClassDetail versionGroupDetails;

	PokemonMove(){
		this.move = NameUrlClass();
		this.versionGroupDetails = NameUrlClassDetail();
	}

	PokemonMove.fromJson(Map json):
		move = NameUrlClass.fromJson(json['move']),
		versionGroupDetails = NameUrlClassDetail.fromJson(json['version_group_details']);

	Map toJson(){
		return {
			'move': this.move.toJson(),
			'version_group_details': this.versionGroupDetails.toJson()
		};
	}

	dynamic operator[](key){
		return this.toJson()[key];
	}
}

class NameUrlClassDetail{
	int levelLearnedAt;
	NameUrlClass moveLearnMethod;
	NameUrlClass versionGroup;

	NameUrlClassDetail(){
		this.levelLearnedAt = 0;
		this.moveLearnMethod = NameUrlClass();
		this.versionGroup = NameUrlClass();
	}

	NameUrlClassDetail.fromJson(Map json):
		levelLearnedAt = json['level_learned_at'] as int,
		moveLearnMethod = NameUrlClass.fromJson(json['move_learn_method']),
		versionGroup = NameUrlClass.fromJson(json['version_group']);

	Map toJson(){
		return {
			'level_learned_at': this.levelLearnedAt,
			'move_learn_method': this.moveLearnMethod.toJson(),
			'version_group': this.versionGroup.toJson()
		};
	}

	dynamic operator[](key){
		return this.toJson()[key];
	}
}
