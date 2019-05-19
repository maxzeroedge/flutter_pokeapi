import 'package:flutter/material.dart';
import 'package:poke_api/widgets/list.dart';
import 'package:poke_api/widgets/details.dart';
import 'package:poke_api/utils/api_requests.dart';

class MyApp extends StatelessWidget {
	void navigateToDetails(BuildContext context, String url){
		fetchPokemonDetails(url).then((details)=>{
			Navigator.push(
				context,
				MaterialPageRoute(builder: (context) => Scaffold(
					appBar: AppBar(
						title: Text(details.name)
					),
					body: MyCustomDetailsWidget(
						item: details
					)
				)),
			)
		});
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			title: 'Pokemon API Database',
			theme: ThemeData(
				primarySwatch: Colors.red,
			),
			home: Scaffold(
				appBar: AppBar(title: Text('Pokemon API Database Browser')),
				body: MyCustomListWidget(
					listType: 'Pokemon',
					futureFunction: fetchAllPokemon,
					navigateNextFunction: navigateToDetails,
					keyName: 'results'
				)
			)
		);
	}
}

void main() => runApp(MyApp());