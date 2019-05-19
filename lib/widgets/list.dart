import 'package:flutter/material.dart';

class MyCustomListWidget extends StatefulWidget {
	  MyCustomListWidget({
		  Key key,
		  this.futureFunction,
		  this.navigateNextFunction,
		  this.listType,
		  this.keyName
	  }) : super(key: key);
	  final String listType;
	  final String keyName;
	  // final Future<List<Map<String, dynamic>>> futureItems;
	  final Function futureFunction;
	  final Function navigateNextFunction;
	  List<Map<String, dynamic>> items;
	  @override
	  MyCustomListState createState() => MyCustomListState();
}

class MyCustomListItemWidget extends StatefulWidget{
	MyCustomListItemWidget({
		Key key,
		this.item,
		this.navigateNextFunction
	}) : super(key: key);
	final dynamic item;
	final Function navigateNextFunction;
	@override
	MyCustomListItemState createState() => MyCustomListItemState();
}

class MyCustomListState extends State<MyCustomListWidget> {
	var items = List();
	@override
	void initState() {
		super.initState();
		widget.futureFunction().then((response)=>{
			this.setState((){
				items = widget.keyName != null ? response[widget.keyName] : response;
			})
		});
	}
	@override
	Widget build(BuildContext context) {
		return Container(
			child: ListView(
				children: <Widget>[
					Center(
						child: Text(
							'List of Available ' + widget.listType
						)
					),
					...(
						this.items != null ? this.items.map(
							(item) => MyCustomListItemWidget(
								item: item,
								navigateNextFunction: widget.navigateNextFunction
							)
						) : List()
					)
				]
			)
		);
	}
}

class MyCustomListItemState extends State<MyCustomListItemWidget> {
	@override
	Widget build(BuildContext context) {
		String name = widget.item['name'].toString();
		name = '${name[0].toUpperCase()}${name.substring(1)}';
		String image = widget.item['image'];
		image = image != null ? image.toString() : "https://flutter.dev/images/catalog-widget-placeholder.png";
		String url = widget.item['url'].toString();
		return GestureDetector(
			onTap: (){
				widget.navigateNextFunction(context, url);
			},
			child: Card(
				child: Column(
					children: <Widget>[
						Image.network(
							image
						),
						Text(
							name
						)
					]
				)
			)
		);
	}
}
