import 'package:covid/components/SubList.dart';
import 'package:covid/model/CountriesModel.dart';
import 'package:covid/pages/ListDetail.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

// class List extends StatefulWidget {
//   List({this.filter, this.snapShot});
//   final String filter;
//   final snapShot;

//   @override
//   _ListState createState() => _ListState();
// }

class List extends StatelessWidget {
  List({this.filter, this.snapShot});
  final String filter;
  final snapShot;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: snapShot.data.countries.length,
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            CountriesModel item = snapShot.data.countries[index];
            return filter == "" || filter == null
                ? listBuilder(item, context)
                : item.country.toLowerCase().contains(filter.toLowerCase())
                    ? listBuilder(item, context)
                    : Container();
          }),
    );
  }

  ExpandablePanel listBuilder(CountriesModel item, context) {
    return ExpandablePanel(
      theme: const ExpandableThemeData(
        headerAlignment: ExpandablePanelHeaderAlignment.center,
        tapHeaderToExpand: true,
      ),
      header: Container(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          item.country,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      collapsed: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: SubList(
            label: "Total confirmed",
            value: item.totalConfirmed.toString(),
            secondary: true),
      ),
      expanded: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                  spreadRadius: .1,
                  blurRadius: 5,
                  offset: Offset(0, 8),
                  color: Colors.black12),
            ]),
        child: Column(
          children: <Widget>[
            SubList(
              label: "Total confirmed",
              value: item.totalConfirmed.toString(),
            ),
            SubList(
              label: "New confirmed",
              value: item.newConfirmed.toString(),
            ),
            SubList(
              label: "New deaths",
              value: item.newDeaths.toString(),
            ),
            SubList(
              label: "Total deaths",
              value: item.totalDeaths.toString(),
            ),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, ListDetail.id, arguments: item);
                },
                child: Text(
                  "View full report",
                  style: TextStyle(color: Colors.redAccent),
                ))
          ],
        ),
      ),
    );
  }
}
