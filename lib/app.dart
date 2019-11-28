

import 'package:flutter/material.dart';
import 'style/style.dart';
import 'screens/layout.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: MyTabs(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(title: AppBarTextStyle),
        ),
        textTheme: TextTheme(
          title: TitleTextStyle,
          body1: Body1TextStyle,
        ),
      ),
    );
  }
}