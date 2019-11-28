import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../style/style.dart';
import '../models/menuContent.dart';
import 'layout.dart';
import 'package:matapp/models/post.dart';

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
              Center(
                child: FutureBuilder<Post>(
                  future: Layout().fetchPost(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data.title);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
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