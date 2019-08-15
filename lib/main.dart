import 'package:flutter/material.dart';
import 'package:poke_api/widgets/list.dart';
import 'package:poke_api/widgets/details.dart';
import 'package:poke_api/utils/api_requests.dart';

class MyApp extends StatelessWidget {

	void navigateToDetails(BuildContext context, String url){
		Navigator.push(
			context,
			MaterialPageRoute(builder: (context) => Scaffold(
				appBar: AppBar(
					title: Text("Details")
				),
				body: MyCustomDetailsWidget(
					fetchDetails: fetchPokemonDetails,
					url: url
				)
			))
		);
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			title: 'Pokemon API Database',
			theme: ThemeData(
				primarySwatch: Colors.red,
			),
			home:  Scaffold(
				appBar: AppBar(title: Text('Pokemon API Database Browser')),
				body: FutureBuilder(
					future: fetchListTypes(),
					builder: ( context, snapshot ){
						/**MyCustomListWidget(
							listType: 'Pokemon',
							futureFunction: fetchAllPokemon,
							navigateNextFunction: navigateToDetails,
							keyName: 'results'
						) */
						if(snapshot.connectionState == ConnectionState.done){
							if(snapshot.hasError){
								return Text("Error");
							} else {
								return CustomPokemonListWidget(
									listData: snapshot.data
								);
							}
						} else {
							return Text("Loading");
						}
					},
				)
			)
		);
	}
}

void main() => runApp(MyApp());