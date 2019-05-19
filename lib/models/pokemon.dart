class Pokemon{
	String name;
	String url;
	String image;

	Pokemon(){
		this.name = '';
		this.url = '';
	}

	Pokemon.fromJson(Map json):
		name = json['name'],
		image = json['sprites'] != null ? json['sprites']['front_default'] : null,
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
		}
		else if(key == 'image'){
			return this.image;
		} else if(key == 'url'){
			return this.url;
		}
	}
}