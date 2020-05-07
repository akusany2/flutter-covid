import 'package:covid/model/CountriesModel.dart';
import 'package:covid/sharedUtilities/camelCaseToUpperSpace.dart';
import 'package:flutter/material.dart';

class ListDetail extends StatelessWidget {
  static const id = "ListDetailPage";
  @override
  Widget build(BuildContext context) {
    final CountriesModel apiData = ModalRoute.of(context).settings.arguments;
    if (apiData == null || apiData.country == "") {
      Navigator.pop(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(apiData.country),
      ),
      body: SafeArea(
        child: ListView(children: generateWidget(apiData.toJson())),
      ),
    );
  }
}

List<Widget> generateWidget(data) {
  List<Widget> list = List<Widget>();

  data.forEach((key, value) {
    if (key != "Country") {
      list.add(Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Text(
              camelCaseToUpperSpace(key),
              style: TextStyle(fontSize: 18),
            ),
            Text(
              value.toString(),
              style: TextStyle(fontSize: 18),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ));
    }
  });

  return list;
}
