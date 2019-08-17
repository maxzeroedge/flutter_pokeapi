import 'package:flutter/material.dart';
import 'dart:convert' as json;

class CustomPokemonListWidget extends StatefulWidget{
	CustomPokemonListWidget({
		Key key,
		this.listData,
		this.type
	}) : super (key: key);

	final List listData;
	final String type;

	@override
	CustomPokemonListState createState() => CustomPokemonListState();
}

class CustomPokemonListState extends State<CustomPokemonListWidget>{
	List<Widget> listWidget = List<Widget>();

	@override
	void initState(){
		super.initState();
		if(widget.listData.length > 0){
			widget.listData.forEach( 
				(item)=> {
					listWidget.add(
						CustomPokemonListItemWidget(
							listItem: item,
							type: widget.type
						)
					)
				}
			);
		} else {
			listWidget = List<Widget>();
			listWidget.add(CustomEmptyListWidget());
		}
	}
	
	@override
	Widget build(BuildContext context) {
		return Container(
			child: ListView(
				children: listWidget,
			),
		);
	}
	
}

class CustomPokemonListItemWidget extends StatefulWidget{
	CustomPokemonListItemWidget({
		Key key,
		this.listItem,
		this.type
	}) : super(key: key);

	final dynamic listItem;
	final String type;

	@override
	CustomPokemonListItemState createState() => CustomPokemonListItemState();
}

class CustomPokemonListItemState extends State<CustomPokemonListItemWidget>{
	List<Widget> listWidget = List<Widget>();

	@override
	void initState(){
		super.initState();
		// Type type = widget.listItem.runtimeType;
	}
	@override
	Widget build(BuildContext context){
		// TODO: Use the type
		Map jsonContent = json.jsonDecode(json.jsonEncode(widget.listItem));
		List<Widget> widgetList = List<Widget>();
		if(widget.type == "TypeList"){
			widgetList.add(Text(jsonContent.keys.first));
			widgetList.add(Text(jsonContent.values.first));
		}
		if(widget.type == "Pokemon"){
			widgetList.add(Text(jsonContent["name"]));
		}

		return Card(
			child: Column(
				children: widgetList,
			),
		);
	}
}

class CustomEmptyListWidget extends StatelessWidget{
	@override
	Widget build(BuildContext buildContext){
		return Text("Empty List?");
	}
}