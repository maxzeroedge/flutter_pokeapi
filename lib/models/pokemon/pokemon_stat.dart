import 'package:poke_api/models/name_url.dart';

class PokemonStat{
	int base_stat;
	int effort;
	PokemonStatDetail stat;

	PokemonStat(){
		this.base_stat = 0;
		this.effort = 0;
		this.stat = PokemonStatDetail();
	}

	PokemonStat.fromJson(Map json):
		base_stat = json['base_stat'] as int,
		effort = json['effort'] as int,
		stat = PokemonStatDetail.fromJson(json['stat']);

	Map toJson(){
		return {
			'base_stat': this.base_stat,
			'effort': this.effort,
			'stat': this.stat.toJson()
		};
	}

	dynamic operator[](key){
		if(key == 'base_stat'){
			return this.base_stat;
		} else if(key == 'effort'){
			return this.effort;
		} else if(key == 'stat'){
			return this.stat;
		}
	}
}

class PokemonStatDetail extends NameUrlClass{}
