
class PokemonForm{
	String name;
	String url;

	PokemonForm(){
		this.name = '';
		this.url = '';
	}

	PokemonForm.fromJson(Map json):
		name = json['name'],
		url = json['url'];

	Map toJson(){
		return {
			'name': this.name,
			'url': this.url
		};
	}

	dynamic operator[](key){
		return this?.toJson()[key];
	}
}
