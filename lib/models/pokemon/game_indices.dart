class GameIndices{
	int gameIndex;
	GameIndexVersion version;

	GameIndices(){
		this.gameIndex = 0;
		this.version = GameIndexVersion();
	}

	GameIndices.fromJson(Map json):
		gameIndex = json['game_index'] as int,
		version = GameIndexVersion.fromJson(json['version']);

	Map toJson(){
		return {
			'game_index': this.gameIndex,
			'version': this.version.toJson()
		};
	}

	dynamic operator[](key){
		return this.toJson()[key];
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
		return this.toJson()[key];
	}
}
