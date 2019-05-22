import 'package:flutter/material.dart';
import 'package:poke_api/models/pokemon/ability.dart';

class MyCustomDetailsWidget extends StatefulWidget {
	MyCustomDetailsWidget({Key key, this.item, this.fetchDetails, this.url}) : super(key: key);
	final dynamic item;
	final Function fetchDetails;
	final String url;

	@override
	MyCustomDetails createState() => MyCustomDetails();
}

class MyCustomDetails extends State<MyCustomDetailsWidget> {
	bool isLoading = true;
	dynamic item;
	@override
	void initState() {
		super.initState();
		if(this.widget.fetchDetails != null) {
			this.widget.fetchDetails(this.widget.url).then((response) =>
				this.setState((){
					item = response;
					isLoading = false;
				})
			);
		}
	}

	Widget getLoadedWidget(){
		String name = item?.name?.toString();
		name = '${name?.substring(0,1)?.toUpperCase()}${name?.substring(1)}';
		String image = item?.image;
		image = image != null && image != '{}'
			? image : "https://flutter.dev/images/catalog-widget-placeholder.png";
		return Column(
			children: <Widget>[
				Expanded(
					child: Center(
						child: ListView(
							children: <Widget>[
								Image.network(
									image,
									width: 96.0,
									height: 96.0
								), 
								Center(
									child: Column(
										children: <Widget>[
											Text("#${item?.id}", style: TextStyle(height: 2.0)),
											Text(name, style: TextStyle(height: 2.0)),
											Text("Order: ${item?.order}", style: TextStyle(height: 2.0)),
											Text("Base Experience: ${item?.baseExperience}", style: TextStyle(height: 2.0)),
											Text("Height: ${item?.height}", style: TextStyle(height: 2.0)),
											Text("Weight: ${item?.weight}", style: TextStyle(height: 2.0)),
											Text("Location Area Encounters:", style: TextStyle(height: 4.0, fontWeight: FontWeight.bold)),
											Text("${item?.locationAreaEncounters}", style: TextStyle(height: 2.0)),
											Text("Abilities: ", style: TextStyle(height: 4.0, fontWeight: FontWeight.bold)),
											Column(
												children: <Widget>[
													...item?.abilities?.map(
														(d)=>
															Text(
																"${d.ability?.name?.substring(0,1)?.toUpperCase()}${d.ability?.name?.substring(1)}", 
																style: TextStyle(height: 2.0)
															)
														)?.toList()
												],
											),
											Text("Moves: "),
											Column(
												children: <Widget>[
													...item?.moves?.map(
														(d)=>
															Text(
																"${d.move?.name?.substring(0,1)?.toUpperCase()}${d.move?.name?.substring(1)}", 
																style: TextStyle(height: 2.0)
															)
														)?.toList()
												],
											)
										],
									))
							],
					)))
			]
		);
	}

	@override
	Widget build(BuildContext context) {			
		var loadedWidget = item != null ? getLoadedWidget() : null;
		var loadingWidget = Column(
			children: <Widget>[
				Expanded(
					child: Center(
						child: CircularProgressIndicator()
					),
				)
			],
		);
		return isLoading ? loadingWidget : loadedWidget;
	}
}
