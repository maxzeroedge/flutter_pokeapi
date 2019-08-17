import 'package:flutter/material.dart';
import 'package:poke_api/widgets/list.dart';
import 'package:poke_api/widgets/details.dart';
import 'package:poke_api/utils/api_requests.dart';

class MyApp extends StatefulWidget {
	@override
	MyAppState createState => MyAppState();
}

class MyAppState extends State<MyApp> {

	int _selectedTab = 0;
	int currentUrl = ""; //https://pokeapi.co/api/v2/pokemon/
	Map<String, dynamic> _pageOptions;

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
					future: fetchUrl(currentUrl),
					builder: ( context, snapshot ){
						if(snapshot.connectionState == ConnectionState.done){
							if(snapshot.hasError){
								return Text("Error");
							} else {
								return CustomPokemonListWidget(
									listData: snapshot.data,
									type: "Pokemon"
								);
							}
						} else {
							return Text("Loading");
						}
					},
				),
				bottomNavigationBar: FutureBuilder(
					future: fetchListTypes(),
					builder: ( context, snapshot ){
						if(snapshot.connectionState == ConnectionState.done){
							if(snapshot.hasError){
								return Text("Unable to load bottom navigation bar");
							} else {
								setState(()=>{
									_pageOptions = snapshot.data;
								})
								return BottomNavigationBar(
									currentIndex: _selectedTab,
									onTap (int indx){
										setState((){
											currentUrl = snapshot.data.entries[indx].value;
											_selectedTab = indx;
										});
									},
									items: snapshot.data.entries.map( (v)=>{
										BottomNavigationBarItem(
											title: v.key
										);
									} )
								)
							}
						} else {
							return Text("Loading");
						}
					},
			)
		);
	}
}

void main() => runApp(MyApp());