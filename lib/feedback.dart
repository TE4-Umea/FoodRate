import 'package:flutter/material.dart';
import 'package:matapp/main.dart';
import 'style.dart';
import 'models/feedbackContent.dart';
import 'models/menuContent.dart';

class Page extends StatefulWidget {
  @override
  PageState createState(){
    return PageState();
  }
}

class PageState extends State<Page> {
  static final _formKey = GlobalKey<FormState>();
  final feedbackKey = Key("feedback");
  final _feedbackContent = FeedbackContent();
  static final DateTime date = DateTime.now();
  static int day = date.weekday;
  bool hasVoted = false;
  int mood = 0;
  int happyFlex = 2;
  int neutralFlex = 2;
  int sadFlex = 2;

  final food = MenuContent.matsedel[day];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Center(
          child: Text(
            MenuContent.foodTime,
            style: MenuTitleTextStyle,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 30),
            child: Column(
              children: <Widget>[
                Text(
                  food.food,
                  style: MenuTimeTextStyle,
                ),
                Text(
                  food.vegFood,
                  style: MenuTimeTextStyle,
                ),
              ],
            ),
          ),
        ),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: happyFlex,
                    child: FlatButton(
                      focusColor: NTIblue,
                      onPressed: () {
                        setState(() {
                          if(mood != 1) {
                            hasVoted = true;
                            mood = 1;
                            happyFlex = 3;
                            neutralFlex = 2;
                            sadFlex = 2;
                          }else {
                            hasVoted = false;
                            mood = 0;

                            happyFlex = 2;
                            neutralFlex = 2;
                            sadFlex = 2;
                          }
                        });
                      },
                      child: Image.asset("assets/images/Glad.png"),
                    ),
                  ),
                  Expanded(
                    flex: neutralFlex,
                    child: FlatButton(
                      focusColor: NTIblue,
                      onPressed: () {
                        setState(() {
                          if(mood != 2) {
                            hasVoted = true;
                            mood = 2;

                            happyFlex = 2;
                            neutralFlex = 3;
                            sadFlex = 2;
                          }else {
                            hasVoted = false;
                            mood = 0;

                            happyFlex = 2;
                            neutralFlex = 2;
                            sadFlex = 2;
                          }
                        });
                      },
                      child: Image.asset("assets/images/Neutral.png"),
                    ),
                  ),
                  Expanded(
                    flex: sadFlex,
                    child: FlatButton(
                      focusColor: NTIblue,
                      onPressed: () {
                        setState(() {
                          if(mood != 3) {
                            hasVoted = true;
                            mood = 3;

                            happyFlex = 2;
                            neutralFlex = 2;
                            sadFlex = 3;
                          }else {
                            hasVoted = false;
                            mood = 0;

                            happyFlex = 2;
                            neutralFlex = 2;
                            sadFlex = 2;
                          }
                        });
                      },
                      child: Image.asset("assets/images/Ledsen.png"),
                    ),
                  )
                ],
              ),
              Visibility(
                key: feedbackKey,
                visible: hasVoted,
                child: Card(
                  child: ExpansionTile(
                    title: Text("Mer Feedback"),
                    children: <Widget>[
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text("Kall mat"),
                        value: _feedbackContent.coldFood,
                        onChanged: (bool value){
                          setState(() {
                            _feedbackContent.coldFood = value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text("Äcklig mat"),
                        value: _feedbackContent.disgustingFood,
                        onChanged: (bool value){
                          setState(() {
                            _feedbackContent.disgustingFood = value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text("Kall mat"),
                        value: _feedbackContent.noFood,
                        onChanged: (bool value){
                          setState(() {
                            _feedbackContent.noFood = value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text("Kall mat"),
                        value: _feedbackContent.longQueue,
                        onChanged: (bool value){
                          setState(() {
                            _feedbackContent.longQueue = value;
                          });
                        },
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: const Text("Övrigt"),
                              value: _feedbackContent.other,
                              onChanged: (bool value){
                                setState(() {
                                  _feedbackContent.other = value;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Visibility(
                              visible: _feedbackContent.other,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Skriv här"
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                          child: RaisedButton(
                            onPressed: () {
                            // Validate returns true if the form is valid, or false
                            // otherwise.
                              if (_formKey.currentState.validate()) {
                              // If the form is valid, display a Snackbar.
                                Scaffold.of(context)
                                  .showSnackBar(SnackBar(content: Text('Processing Data')));
                            }
                            },
                          child: Text('Submit'),
                          ),
                        ),
                      ],
                  ),
                    ],
                      ),
                ),
              ),
            ],
              ),
            ),
      ],
    );
  }
}
