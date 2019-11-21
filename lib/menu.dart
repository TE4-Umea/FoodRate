import 'package:flutter/material.dart';
import 'style.dart';
import 'models/menuContent.dart';

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      food(MenuContent.mon),
                      food(MenuContent.tue),
                      food(MenuContent.wed),
                      food(MenuContent.thu),
                      food(MenuContent.fri)
                    ],
                  ),
                ),
              )
            ],
          );
  }
  Widget food(day){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Text(
            day.day,
            style: TitleTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 5, 5, 5),
          child:
          Column(
            children: <Widget>[
              dish(day, day.food),
              dish(day, day.vegFood),
            ],
          ),
        ),
      ],
    );
  }
  Row dish(day, dish){
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
