class GameIndices{
	int game_index;
	GameIndexVersion version;

	GameIndices(){
		this.game_index = 0;
		this.version = GameIndexVersion();
	}

	GameIndices.fromJson(Map json):
		game_index = json['game_index'] as int,
		version = GameIndexVersion.fromJson(json['version']);

	Map toJson(){
		return {
			'game_index': this.game_index,
			'version': this.version.toJson()
		};
	}

	dynamic operator[](key){
		if(key == 'game_index'){
			return this.game_index;
		} else if(key == 'version'){
			return this.version;
		}
	}
}

class GameIndexVersion{
	String name;
	String url;

	GameIndexVersion(){
		this.name = '';
		this.url = '';
	}

	GameIndexVersion.fromJson(Map json):
		name = json['name'],
		url = json['url'];

	Map toJson(){
		return {
			'name': this.name,
			'url': this.url
		};
	}

	dynamic operator[](key){
		if(key == 'name'){
			return this.name;
		} else if(key == 'url'){
			return this.url;
		}
	}
}
