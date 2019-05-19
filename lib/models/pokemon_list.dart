import 'pokemon.dart';
class PokemonList{
	int count;
	String next;
	String previous;
	List<Pokemon> results;

	PokemonList(String count, String next, String previous){
		this.count = count is int ? count : int.parse(count);
		this.next = next;
		this.previous = previous;
		this.results = List<Pokemon>();
	}

	PokemonList.fromJson(Map json):
			count = json['count'] is int ? json['count'] : int.parse(json['count'].toString()),
			next = json['next'],
			previous = json['previous'],
			results = json['results'];

	Map toJson(){
		return {
			'count': this.count,
			'next': this.next,
			'previous': this.previous,
			'results': this.results.map((p)=>p.toJson())
		};
	}

	List<Pokemon> operator[](key){
		return this.results;
	}
}