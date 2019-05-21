import 'package:poke_api/models/name_url.dart';

class PokemonMove{
	NameUrlClass move;
	List<PokemonMoveVersionGroupDetail> versionGroupDetails;

	PokemonMove(){
		this.move = NameUrlClass();
		this.versionGroupDetails = List<PokemonMoveVersionGroupDetail>();
	}

	PokemonMove.fromJson(Map json):
		move = NameUrlClass.fromJson(json['move']),
		versionGroupDetails = (json['version_group_details'] as List)?.map((d)=>PokemonMoveVersionGroupDetail.fromJson(d))?.toList();

	Map toJson(){
		return {
			'move': this.move.toJson(),
			'version_group_details': this.versionGroupDetails?.map((d)=>d.toJson())?.toList()
		};
	}

	dynamic operator[](key){
		return this?.toJson()[key];
	}
}

class PokemonMoveVersionGroupDetail{
	int levelLearnedAt;
	NameUrlClass moveLearnMethod;
	NameUrlClass versionGroup;

	PokemonMoveVersionGroupDetail(){
		this.levelLearnedAt = 0;
		this.moveLearnMethod = NameUrlClass();
		this.versionGroup = NameUrlClass();
	}

	PokemonMoveVersionGroupDetail.fromJson(Map json):
		levelLearnedAt = json['level_learned_at'] as int,
		moveLearnMethod = NameUrlClass.fromJson(json['move_learn_method']),
		versionGroup = NameUrlClass.fromJson(json['version_group']);

	Map toJson(){
		return {
			'level_learned_at': this.levelLearnedAt,
			'move_learn_method': this.moveLearnMethod?.toJson(),
			'version_group': this.versionGroup?.toJson()
		};
	}

	dynamic operator[](key){
		return this?.toJson()[key];
	}
}