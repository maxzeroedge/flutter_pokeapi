
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
		if(key == 'name'){
			return this.name;
		} else if(key == 'url'){
			return this.url;
		}
	}
}
