import 'package:covid/components/SubList.dart';
import 'package:covid/model/APIResponseModel.dart';
import 'package:covid/pages/ListDetail.dart';
import 'package:covid/services/covidService.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class List extends StatefulWidget {
  List({this.filter});
  final String filter;
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: CovidAPIService.getAllData(),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data != null) {
            return RefreshIndicator(
              child: ListView.builder(
                  itemCount: snapShot.data.length,
                  itemBuilder: (context, index) {
                    print(widget.filter);
                    APIResponseModel item = snapShot.data[index];
                    return widget.filter == "" || widget.filter == null
                        ? listBuilder(item, context)
                        : item.country
                                .toLowerCase()
                                .contains(widget.filter.toLowerCase())
                            ? listBuilder(item, context)
                            : Container();
                  }),
              onRefresh: () => CovidAPIService.getAllData(forceUpdate: true),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ExpandablePanel listBuilder(APIResponseModel item, context) {
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
            label: "Total cases",
            value: item.cases.toString(),
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
              label: "Total cases",
              value: item.cases.toString(),
            ),
            SubList(
              label: "Today cases",
              value: item.todayCases.toString(),
            ),
            SubList(
              label: "Today deaths",
              value: item.todayDeaths.toString(),
            ),
            SubList(
              label: "Total deaths",
              value: item.deaths.toString(),
            ),
            FlatButton(
                onPressed: () {
                  print("clicked");
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
