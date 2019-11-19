import 'package:flutter/material.dart';
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
  final _feedbackContent = FeedbackContent();
  static final DateTime date = DateTime.now();
  static int day = date.weekday;

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
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("Övrigt"),
                value: _feedbackContent.other,
                onChanged: (bool value){
                  setState(() {
                    _feedbackContent.other = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 27, 0),
                child: TextFormField(
                  autofocus: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
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
            )
            ],
          ),
        ),
      ],
    );
  }
}
