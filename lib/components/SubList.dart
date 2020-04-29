import 'package:covid/constants.dart';
import 'package:flutter/cupertino.dart';

class SubList extends StatelessWidget {
  SubList({@required this.label, @required this.value, this.secondary = true});

  final String label;
  final String value;
  final bool secondary;

  double fontSize = 16;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                  fontSize: fontSize,
                  color: secondary ? ksecondaryTextColor : kPrimaryTextColor,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: fontSize,
                  color: secondary ? ksecondaryTextColor : kPrimaryTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
