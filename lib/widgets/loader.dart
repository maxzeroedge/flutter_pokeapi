import 'package:flutter/material.dart';

class CustomFullScreenLoader extends StatelessWidget{
	@override
	Widget build(BuildContext context) {
		// TODO: implement build
		return Column(
			children: <Widget>[
				Expanded(
					child: Center(
						child: CircularProgressIndicator()
					),
				)
			],
		);
	}
	
}