import 'package:http/http.dart';
import 'dart:convert' as json;
import 'package:poke_api/models/pokemon_list.dart';
import 'package:poke_api/models/pokemon.dart';

Future<PokemonList> fetchAllPokemon() async{
	final Response response = await get('https://pokeapi.co/api/v2/pokemon/');
	if (response.statusCode == 200) {
		Map<String, dynamic> jsonResponse = json.jsonDecode(response.body);
		PokemonList pokemonList = PokemonList(jsonResponse['count'].toString(), jsonResponse['next'], jsonResponse['previous']);
		for(dynamic result in (jsonResponse['results'] as List<dynamic>)){
			if(result != null){
				pokemonList.results.add(Pokemon.fromJson(result));
			}
		}
		return pokemonList;
	} else {
		return PokemonList('0', '', '');
	}
}

Future<Pokemon> fetchPokemonDetails(String url) async{
	//https://pokeapi.co/api/v2/pokemon/1/
	final Response response = await get(url);
	if (response.statusCode == 200) {
		Map<String, dynamic> jsonResponse = json.jsonDecode(response.body);
		Pokemon pokemon = Pokemon.fromJson(jsonResponse);
		pokemon.url = url;
		return pokemon;
	} else {
		return Pokemon();
	}
}

Future<List<Map<String, String>>> fetchListTypes() async{
	final Response response = await get("https://pokeapi.co/api/v2/");
	if (response.statusCode == 200) {
		Map<String, String> jsonResponse = json.jsonDecode(response.body);
		return jsonResponse.keys.map( (v)  => {v: jsonResponse[v]} );
	} else {
		return List<Map<String, String>>();
	}
}
f(String e) {
}
