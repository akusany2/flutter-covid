import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({@required this.text, this.size});
  final String text;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size),
    );
  }
}
