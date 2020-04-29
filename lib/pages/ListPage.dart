import 'package:covid/components/ListComponent.dart';
import 'package:covid/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  static const id = "ListPage";
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
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

  bool showClearIcon;
  final _searchInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Places list"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      TextFormField(
                        controller: _searchInputController,
                        decoration: InputDecoration(
                            hintText: 'Search country',
                            contentPadding: EdgeInsets.only(left: 20)),
                      ),
                      Positioned(
                        child: Visibility(
                          visible: _searchInputController.text == null ||
                                  _searchInputController.text == ""
                              ? false
                              : true,
                          child: FlatButton(
                            onPressed: () {
                              _searchInputController.text = "";
                            },
                            child: Icon(
                              Icons.highlight_off,
                              color: ksecondaryTextColor,
                            ),
                          ),
                        ),
                        right: -20,
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: List(filter: _searchInputController.text),
            ),
          ],
        ),
      ),
    );
  }
}
