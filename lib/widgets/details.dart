import 'package:flutter/material.dart';
import 'package:poke_api/utils/api_requests.dart';
import 'package:poke_api/widgets/loader.dart';

class MyCustomDetailsWidget extends StatefulWidget {
	MyCustomDetailsWidget({Key key, this.item, this.url}) : super(key: key);
	final dynamic item;
	final String url;

	@override
	MyCustomDetailsState createState() => MyCustomDetailsState();
}

class MyCustomDetailsState extends State<MyCustomDetailsWidget> {
	bool isLoading = true;
	dynamic item;
	@override
	void initState() {
		super.initState();
	}

	@override
	Widget build(BuildContext context) {
		return FutureBuilder(
			future: fetchDetailsUrl(widget.url),
			builder: (listTileContext, snapshot) {
				if(snapshot.connectionState == ConnectionState.done){
					if(snapshot.hasError){
						return Text("Error");
					} else {
						Map<String, dynamic> data = snapshot.data;
						return ListView(
							children: <Widget>[
								MyCustomDetailsBlockWidget(
									detailData: data,
								)
							],
						);
					}
				} else {
					return CustomFullScreenLoader();
				}
			}
		);
	}
}

class MyCustomDetailsBlockWidget extends StatefulWidget {
	MyCustomDetailsBlockWidget({
		Key key,
		this.detailData
	}): super(key: key);
	final dynamic detailData;

	@override
	MyCustomDetailsBlockState createState() => MyCustomDetailsBlockState();
}

class MyCustomDetailsBlockState extends State<MyCustomDetailsBlockWidget> {

	dynamic getDataFromList(dynamic detailData, dynamic key, int type){
		 // 0 for map, 1 for list
		if(type == 0){
			return detailData[key];
		} else if(type == 1){
			return key;
		}
	}

	List<Widget> getWidgetList(dynamic detailData){
		List<dynamic> dynamicList;
		int type = 1;
		if(detailData.runtimeType == List<dynamic>().runtimeType){
			dynamicList = detailData;
			type = 1;
		} else if(detailData.runtimeType == Map<String, dynamic>().runtimeType){
			dynamicList = detailData.keys.toList();
			type = 0;
			/* return MyCustomDetailsBlockWidget(
				detailData: detailData,
			); */
		}
		List<Widget> widgetList = List<Widget>();
		for( dynamic v in dynamicList ){
			List<Widget> childWidgetList = List<Widget>();
			if( v.runtimeType != List<dynamic>().runtimeType ){
				childWidgetList.add( getChildWidget(v) );
			}
			childWidgetList.add(
				getChildWidget( 
					getDataFromList( detailData, v, type )
				)
			);
			widgetList.add(
				Card(
					child: Column(
						mainAxisAlignment: MainAxisAlignment.start,
						children: childWidgetList,
					),
				)
			);
		}
		dynamicList.forEach( (v) => {
			
		});
		return widgetList;
	}

	Widget getChildWidget(dynamic detailData){
		if(detailData.runtimeType == List<dynamic>().runtimeType){
			return MyCustomDetailsBlockWidget(detailData: detailData);
		} else if(detailData.runtimeType == Map<String, dynamic>().runtimeType){
			return MyCustomDetailsBlockWidget(detailData: detailData);
		}
		return Text(detailData.toString());
	}
	
	@override
	Widget build(BuildContext context){
		return Column(
			children: getWidgetList(widget.detailData),
		);
	}
}