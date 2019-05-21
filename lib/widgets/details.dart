import 'package:flutter/material.dart';

class MyCustomDetailsWidget extends StatefulWidget {
	MyCustomDetailsWidget({Key key, this.item, this.fetchDetails, this.url}) : super(key: key);
	final dynamic item;
	final Function fetchDetails;
	final String url;

	@override
	MyCustomDetails createState() => MyCustomDetails();
}

class MyCustomDetails extends State<MyCustomDetailsWidget> {
	@override
	void initState() {
		super.initState();
		/*if(this.widget.fetchDetails != null) {
			this.widget.fetchDetails(this.widget.url).then((response) =>
			{
				widget.item = response;
			});
		}*/
	}

	@override
	Widget build(BuildContext context) {
		String name = widget.item['name'].toString();
		name = '${name[0].toUpperCase()}${name.substring(1)}';
		String image = widget.item['image'];
		image = image != null
			? image.toString()
			: "https://flutter.dev/images/catalog-widget-placeholder.png";
		String url = widget.item['url'].toString();
		return Column(
			children: <Widget>[
				Expanded(
					child: Center(
						child: Column(
						children: <Widget>[
							Image.network(image), 
							Text("#${widget.item['id']}"),
							Text(name),
							Text("Order: ${widget.item['order']}"),
							Text("Base Experience: ${widget.item['base_experience']}"),
							Text("Height: ${widget.item['height']}"),
							Text("Width: ${widget.item['width']}"),
							Text("Location Area Encounters: ${widget.item['location_area_encounters']}"),
							Text("Abilities: ${widget.item['abilities']}"),
						],
					)))
			]
		);
	}
}
