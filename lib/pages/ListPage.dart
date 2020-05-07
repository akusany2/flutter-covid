import 'package:covid/components/ListComponent.dart';
import 'package:covid/components/SearchInputComponent.dart';
import 'package:covid/services/covidService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  static const id = "ListPage";
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool showClearIcon;
  Future getCovidDataApi;
  final _searchInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCovidDataApi = CovidAPIService.getAllData();
    _searchInputController.addListener(() {
      setState(() {
        showClearIcon = _searchInputController.text.length > 0 ? true : false;
      });
    });
  }

  @override
  void dispose() {
    _searchInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Places list"),
      ),
      body: FutureBuilder(
          future: getCovidDataApi,
          builder: (context, snapShot) {
            if (snapShot.hasData && snapShot.data != null) {
              return SafeArea(
                child: RefreshIndicator(
                  onRefresh: () =>
                      CovidAPIService.getAllData(forceUpdate: true),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("World Total Cases"),
                            Text(CovidAPIService.allData != null
                                ? CovidAPIService.allData.global.totalConfirmed
                                    .toString()
                                : "---")
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          SearchInputComponent(
                              searchInputController: _searchInputController)
                        ],
                      ),
                      Expanded(
                        child: List(
                            filter: _searchInputController.text,
                            snapShot: snapShot),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
