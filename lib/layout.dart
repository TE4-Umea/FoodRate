
import 'package:flutter/material.dart';
import 'package:matapp/app.dart';
import 'style.dart';
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                child: Icon(Icons.settings),
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