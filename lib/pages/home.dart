import 'package:flutter/material.dart';
import 'package:poke_api/widgets/list.dart';
import 'package:poke_api/widgets/loader.dart';
import 'package:poke_api/utils/api_requests.dart';

class HomeWidget extends StatefulWidget {
	HomeWidget({
		Key key,
		this.currentUrl
	}) : super (key: key);

	final String currentUrl;
	@override
	HomeState createState() => HomeState();
}

class HomeState extends State<HomeWidget> {
	@override
	Widget build(BuildContext context){
		if(widget.currentUrl.isEmpty){
			return CustomFullScreenLoader();
		} else {
			return FutureBuilder(
				future: fetchUrl(widget.currentUrl),
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
						return CustomFullScreenLoader();
					}
				},
			);
		}
	}
}