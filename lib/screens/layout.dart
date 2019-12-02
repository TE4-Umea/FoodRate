import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:matapp/models/menuData.dart';
import 'package:matapp/models/postData.dart';
import '../Storage/storage.dart';
import '../style/style.dart';
import 'menu.dart' as menu;
import 'feedback.dart' as feedback;

class MyTabs extends StatefulWidget {
  @override
  Layout createState() => new Layout();
}

class Layout extends State<MyTabs> with TickerProviderStateMixin {
  final List<FancyTab> myTabs = [
    new FancyTab("Dagens lunch", Icon(Icons.home)),
    new FancyTab("Veckans matsedel", Icon(Icons.list))
  ];
  TabController _controller;
  FancyTab _myHandler;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: myTabs.length);
    _myHandler = myTabs[0];
    _controller.addListener(_handleSelected);
    final Future thisPost = fetchPost();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<Post> fetchPost() async {
    final response =
    await http.get('http://192.168.2.36:4000/rate_event?app_id=test_app_id&rating=2');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      Post parsedJson = Post.fromJson(json.decode(response.body));
      return parsedJson;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
  Future<MenuData> fetchMenu() async {
    final response = await http.get('https://pizza.umea-ntig.se/fetch_food_menu_event');

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      // If server returns an OK response, parse the JSON.
      MenuData data = MenuData.fromJson(jsonResponse[0]);
      return data;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  void _handleSelected() {
    setState(() {
      _myHandler = myTabs[_controller.index];
    });
  }
    @override
    Widget build(BuildContext context) {
      return DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
              child: Image.asset(
                  'assets/images/nti.png', fit: BoxFit.scaleDown),
            ),
            backgroundColor: NTIpink,
            title: Center(child: new Text(
                _myHandler.title,
                style: AppbarTextStyle
            )),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context){
                        return Options(storageKey: "settings");
                      }
                    ),
                },
                )
              ),
            ],
          ),
          bottomNavigationBar: new Material(
            color: NTIpurple,
            child: new TabBar(
              controller: _controller,
              tabs: <Tab>[
                new Tab(icon: myTabs[0].icon),
                new Tab(icon: myTabs[1].icon)
              ],
            ),
          ),
          body: new TabBarView(controller: _controller, children: <Widget>[
            new feedback.Page(),
            new menu.Page()
          ]),
        ),
      );
    }
  }
class FancyTab{
  final String title;
  final Icon icon;

  FancyTab(this.title, this.icon);
}
class Options extends StatefulWidget{
  final String storageKey;
  Options({
    @required this.storageKey
});
  @override
  OptionsState createState() => new OptionsState();

}

class OptionsState extends State<Options>{
  static final _formKey = GlobalKey<FormState>();
  static bool vegFoodOption;
  static bool specFood;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Storage.isKeySet(widget.storageKey).then((set) {
      print(set);
      if (set == true) {
        Storage.get(widget.storageKey).then((value) {
          print(value);
          setState(() {
            updateValues(value);
          });
        });
      } else {
        setState(() {
          vegFoodOption = false;
        });
      }
    });
  }


  updateValues(value) {
    vegFoodOption = value;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Text("Settings"),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SwitchListTile(
                    title: Text("Vegetarian"),
                    value: vegFoodOption == null ? false : vegFoodOption,
                    onChanged: (bool optionValue) {
                      setState(() {
                        vegFoodOption = optionValue;
                        updateValues(vegFoodOption);
                      });
                      Storage.set(widget.storageKey, OptionsState.vegFoodOption);
                    },
                  ),
                  SwitchListTile(
                    title: Text("Annan Specialkost"),
                    value: specFood == null ? false : specFood,
                    onChanged: (bool optionValue) {
                      setState(() {
                        vegFoodOption = optionValue;
                        updateValues(vegFoodOption);
                      });
                      Storage.set(widget.storageKey, OptionsState.vegFoodOption);
                    },
                  ),
                ],
              ),
            ),
            FlatButton(
              onPressed: () => {
                Navigator.pop(context),
              },
              child: Text("Close"),
            )
          ],
        ),
      ),
    );
  }
}
