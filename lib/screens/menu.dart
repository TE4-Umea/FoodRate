import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:matapp/models/menuData.dart';
import '../style/style.dart';
import '../models/menuContent.dart';
import 'layout.dart';
import 'package:matapp/models/postData.dart';

class Page extends StatelessWidget{

  Widget build(BuildContext context){
    return new Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(80, 5, 80, 5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Mattid",
                          style: MenuTimeTextStyle,
                        ),
                      ),
                      Center(
                        child: Text(
                          MenuContent.foodTime,
                          style: MenuTitleTextStyle,

                        ),
                      )
                    ],
                  ),
                ),
              ),
              new Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder<MenuData>(
                    future: Layout().fetchMenu(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                      var data = snapshot.data;
                      print(data);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        food(data, "Måndag")
                        /*food(MenuContent.tue),
                        food(MenuContent.wed),
                        food(MenuContent.thu),
                        food(MenuContent.fri)*/
                        ],
                      );
                      } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                      }

                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                ),
                ),
              )
            ],
          );
  }
  Widget food(menuData, day){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Text(
            day,
            style: TitleTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 5, 5, 5),
          child:
          Column(
            children: <Widget>[
              dish(menuData.food),
              dish(menuData.vegFood),
            ],
          ),
        ),
      ],
    );
  }
  Row dish(dish){
    return new Row(
      children: <Widget>[
        Icon(Icons.fastfood),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0) ,
          child: Text(
              dish,
              style: Body1TextStyle
          ),
        ),
      ],
    );
  }
}