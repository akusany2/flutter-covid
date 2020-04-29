import 'package:covid/model/APIResponseModel.dart';
import 'package:dart_casing/dart_casing.dart';
import 'package:flutter/material.dart';

class ListDetail extends StatelessWidget {
  static const id = "ListDetailPage";
  @override
  Widget build(BuildContext context) {
    final APIResponseModel apiData = ModalRoute.of(context).settings.arguments;
    if (apiData == null || apiData.country == "") {
      Navigator.pop(context);
    }
    apiData.toJSON().forEach((key, value) {
      print(key);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(apiData.country),
      ),
      body: SafeArea(
        child: ListView(children: generateWidget(apiData.toJSON())),
      ),
    );
  }
}

List<Widget> generateWidget(data) {
  List<Widget> list = List<Widget>();

  data.forEach((key, value) {
    list.add(Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Text(
            Casing.titleCase(key),
            style: TextStyle(fontSize: 18),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    ));
  });

  return list;
}
