class NameUrlClass{
	String name;
	String url;

	NameUrlClass(){
		this.name = '';
		this.url = '';
	}

	NameUrlClass.fromJson(Map json):
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
