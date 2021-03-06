import 'package:flutter/material.dart';
import 'package:poke_api/pages/home.dart';
import 'package:poke_api/utils/api_requests.dart';
import 'package:poke_api/utils/string_utils.dart';

class MyApp extends StatefulWidget {
	@override
	MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

	String currentUrl = ""; //https://pokeapi.co/api/v2/pokemon/
	List<Map<String, dynamic>> _pageTypes;

	@override
	void initState(){
		super.initState();
		fetchListTypes().then((response)=>{
			this.setState((){
				_pageTypes = response.entries.map( (v)=> {v.key: v.value} ).toList();
				currentUrl = _pageTypes.first.values.first;
			})
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
				body: SafeArea(
					child: HomeWidget(
						currentUrl: currentUrl
					),
				),
				drawer: _pageTypes != null ? Drawer(
					child: ListView(
						children: <Widget>[
							Container(
								height: 55.0,
								child: DrawerHeader(
									child: Text('Pokemon List Type'),
									margin: EdgeInsets.all(0),
									decoration: BoxDecoration(
										color: Colors.blue,
									),
								),
							),
							..._pageTypes.map( (v) => 
								Builder(
									builder: (listTileContext) => ListTile(
										title: Text(
											capitalizeString(v.keys.first),
											style: TextStyle(height: 2, fontSize: 17.0)
										),
										onTap: (){
											setState(() {
												currentUrl = v.values.first;
												Navigator.of(listTileContext).pop();
											});
										},
									)
								)
							),
						],
					)
				) : Text("Hello"),
			)
		);
	}
}

void main() => runApp(MyApp());