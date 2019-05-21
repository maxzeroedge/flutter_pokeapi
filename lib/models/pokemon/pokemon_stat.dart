import 'package:poke_api/models/name_url.dart';

class PokemonStat{
	int baseStat;
	int effort;
	NameUrlClass stat;

	PokemonStat(){
		this.baseStat = 0;
		this.effort = 0;
		this.stat = NameUrlClass();
	}

	PokemonStat.fromJson(Map json):
		baseStat = json['base_stat'] as int,
		effort = json['effort'] as int,
		stat = NameUrlClass.fromJson(json['stat']);

	Map toJson(){
		return {
			'base_stat': this.baseStat,
			'effort': this.effort,
			'stat': this.stat.toJson()
		};
	}

	dynamic operator[](key){
		return this.toJson()[key];
	}
}
