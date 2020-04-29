import 'package:covid/pages/ListDetail.dart';
import 'package:covid/pages/ListPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CovidMain());
}

class CovidMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        accentColor: Colors.redAccent,
        primaryColor: Colors.red,
      ),
      initialRoute: ListPage.id,
      routes: {
        ListPage.id: (context) => ListPage(),
        ListDetail.id: (context) => ListDetail(),
      },
    );
  }
}
