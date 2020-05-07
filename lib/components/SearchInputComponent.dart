import 'package:covid/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInputComponent extends StatelessWidget {
  const SearchInputComponent({
    Key key,
    @required TextEditingController searchInputController,
  })  : _searchInputController = searchInputController,
        super(key: key);

  final TextEditingController _searchInputController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
