import 'package:flutter/material.dart';
import 'package:matapp/Storage/storage.dart';
import 'package:matapp/screens/layout.dart';
import '../style/style.dart';
import '../models/feedbackContent.dart';
import '../models/menuContent.dart';
import '../style/my_flutter_app_icons.dart' as CustomIcons;
import 'package:http/http.dart' as http;


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

  static final Color defaultColor = Color.fromRGBO(34, 34, 34, 1.0);
  static final Color activeColor = Color.fromRGBO(221, 8, 133, 1.0);
  Color happyColor = defaultColor;
  Color neutralColor = defaultColor;
  Color sadColor = defaultColor;

  final food = MenuContent.matsedel[day-1];
  @override
  Widget build(BuildContext context) {
    return new ListView(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: IconButton(
                          focusColor: NTIpink,
                          onPressed: () {
                            setState(() {
                              if(mood != 1) {
                                hasVoted = true;
                                mood = 1;
                                happyColor = activeColor;
                                neutralColor = defaultColor;
                                sadColor = defaultColor;
                              }else {
                                hasVoted = false;
                                mood = 0;

                                happyColor = defaultColor;
                                neutralColor = defaultColor;
                                sadColor = defaultColor;
                              }
                            });
                          },
                          icon:
                          Icon(CustomIcons.MyFlutterApp.ledsen),
                          iconSize: 90,
                          color: happyColor
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: IconButton(
                          focusColor: NTIpink,
                          onPressed: () {
                            setState(() {
                              if(mood != 2) {
                                hasVoted = true;
                                mood = 2;

                                happyColor = defaultColor;
                                neutralColor = activeColor;
                                sadColor = defaultColor;
                              }else {
                                hasVoted = false;
                                mood = 0;

                                happyColor = defaultColor;
                                neutralColor = defaultColor;
                                sadColor = defaultColor;
                              }
                            });
                          },
                          icon:
                          Icon(CustomIcons.MyFlutterApp.neutral),
                          iconSize: 90,
                          color: neutralColor,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: IconButton(
                          focusColor: NTIpink,
                          onPressed: () {
                            setState(() {
                              if(mood != 3) {
                                hasVoted = true;
                                mood = 3;

                                happyColor = defaultColor;
                                neutralColor = defaultColor;
                                sadColor = activeColor;
                              }else {
                                hasVoted = false;
                                mood = 0;

                                happyColor = defaultColor;
                                neutralColor = defaultColor;
                                sadColor = defaultColor;
                              }
                            });
                          },
                            icon:
                            Icon(CustomIcons.MyFlutterApp.glad),
                            iconSize: 90,
                            color: sadColor
                        ),
                      )
                    ],
                  ),
                ),
                Visibility(
                  key: feedbackKey,
                  visible: hasVoted,
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ExpansionTile(
                        title: Text(
                          "Ytterligare feedback",
                          style: TitleTextStyle,
                        ),
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CheckboxListTile(
                                activeColor: NTIpurple,
                                controlAffinity: ListTileControlAffinity.leading,
                                title: const Text(
                                  "Kall mat",
                                  style: Body1TextStyle,
                                ),
                                value: _feedbackContent.coldFood,
                                onChanged: (bool value){
                                  setState(() {
                                    _feedbackContent.coldFood = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                activeColor: NTIpurple,
                                controlAffinity: ListTileControlAffinity.leading,
                                title: const Text(
                                  "Äcklig mat",
                                  style: Body1TextStyle,
                                ),
                                value: _feedbackContent.disgustingFood,
                                onChanged: (bool value){
                                  setState(() {
                                    _feedbackContent.disgustingFood = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                activeColor: NTIpurple,
                                controlAffinity: ListTileControlAffinity.leading,
                                title: const Text(
                                  "Slut mat",
                                  style: Body1TextStyle,
                                ),
                                value: _feedbackContent.noFood,
                                onChanged: (bool value){
                                  setState(() {
                                    _feedbackContent.noFood = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                activeColor: NTIpurple,
                                controlAffinity: ListTileControlAffinity.leading,
                                title: const Text(
                                  "Lång kö",
                                  style: Body1TextStyle,
                                ),
                                value: _feedbackContent.longQueue,
                                onChanged: (bool value){
                                  setState(() {
                                    _feedbackContent.longQueue = value;
                                  });
                                },
                              ),
                              CheckboxListTile(
                                activeColor: NTIpurple,
                                controlAffinity: ListTileControlAffinity.leading,
                                title: const Text(
                                  "Matsedeln stämde inte",
                                  style: Body1TextStyle,
                                ),
                                value: _feedbackContent.wrongFood,
                                onChanged: (bool value){
                                  setState(() {
                                    _feedbackContent.wrongFood = value;
                                  });
                                },
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: CheckboxListTile(
                                      activeColor: NTIpurple,
                                      controlAffinity: ListTileControlAffinity.leading,
                                      title: const Text(
                                        "Övrigt",
                                        style: Body1TextStyle,
                                      ),
                                      value: _feedbackContent.other,
                                      onChanged: (bool value){
                                        setState(() {
                                          _feedbackContent.other = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
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
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 3,
                                        child: CheckboxListTile(
                                          activeColor: NTIpurple,
                                          controlAffinity: ListTileControlAffinity.leading,
                                          title: const Text(
                                            "Sagt till personal",
                                            style: Body1TextStyle,
                                          ),
                                          value: _feedbackContent.toldStaff,
                                          onChanged: (bool value){
                                            setState(() {
                                              _feedbackContent.toldStaff = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                          child: RaisedButton(
                                            color: NTIpurple,
                                            onPressed: () async {

                                              Future<String> findDevice() async{
                                                String thisDevice;
                                                await Storage.isIdKeySet("device")
                                                    .then((set) async {
                                                  print(set);
                                                  if (set == true) {
                                                    await Storage.getId("device")
                                                        .then((value) {
                                                      setState(() {
                                                        print("value: $value");
                                                        thisDevice = value;
                                                        return thisDevice;
                                                      });
                                                    });
                                                  }
                                                  print("thisDevice: $thisDevice");
                                                  return thisDevice;
                                                  //TODO: Save data locally
                                                  //TODO: Function to send
                                                  //TODO: Expansiontile setstate med sparad data
                                                });
                                              }// Validate returns true if the form is valid, or false
                                              // otherwise.
                                              if (_formKey.currentState.validate()) {
                                                // If the form is valid, display a Snackbar.
                                                Scaffold.of(context)
                                                    .showSnackBar(SnackBar(content: Text('Processing Data')));
                                              }


                                              Future<http.Response> sendReq() async{
                                                String thisDevice;
                                                await Storage.isIdKeySet("device")
                                                    .then((set) async {
                                                  print(set);
                                                  if (set == true) {
                                                    await Storage.getId("device")
                                                        .then((value) async{
                                                        print("value: $value");
                                                        thisDevice = value;
                                                        var response = await http.post(
                                                            "https://pizza.umea-ntig.se/rate",
                                                            body: {
                                                              'app_id' : value,
                                                              'rating' : mood.toString()
                                                            }
                                                        );
                                                        print("Response: ${response.body}");
                                                    });
                                                  }
                                                });

                                              }
                                              await sendReq();
                                            },
                                            child: Text(
                                              'Skicka',
                                              style: SendTextStyle,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
