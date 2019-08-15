import 'package:flutter/material.dart';

class CustomPokemonListWidget extends StatefulWidget{
	CustomPokemonListWidget({
		Key key,
		this.listData
	}) : super (key: key);

	final List listData;

	@override
	CustomPokemonListState createState() => CustomPokemonListState();
}

class CustomPokemonListState extends State<CustomPokemonListWidget>{
	List<Widget> listWidget;

	@override
	void initState(){
		super.initState();
		if(widget.listData.length > 0){
			listWidget = widget.listData.map( 
				(item)=> CustomPokemonListItemWidget(
					listItem: item
				)
			).cast<Widget>();
		} else {
			listWidget = List<Widget>();
			listWidget.add(CustomEmptyListWidget());
		}
	}
	
	@override
	Widget build(BuildContext context) {
		return Container(
			child: ListView(
				children: <Widget>[
					...listWidget
				],
			),
		);
	}
	
}

class CustomPokemonListItemWidget extends StatefulWidget{
	CustomPokemonListItemWidget({
		Key key,
		this.listItem
	}) : super(key: key);

	final Object listItem;

	@override
	CustomPokemonListItemState createState() => CustomPokemonListItemState();
}

class CustomPokemonListItemState extends State<CustomPokemonListItemWidget>{
	@override
	Widget build(BuildContext context){
		// TODO: implement build
		return null;
	}
}

class CustomEmptyListWidget extends StatelessWidget{
	@override
	Widget build(BuildContext buildContext){
		return Text("Empty List?");
	}
}