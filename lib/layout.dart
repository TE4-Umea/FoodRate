
import 'package:flutter/material.dart';
import 'style.dart';
import 'menu.dart' as menu;
import 'feedback.dart' as feedback;

class MyTabs extends StatefulWidget {
  @override
  Layout createState() => new Layout();
}

class Layout extends State<MyTabs> with TickerProviderStateMixin{
  TabController controller;

  final List<Tab> myTabs = <Tab>[
    Tab(icon: Icon(Icons.home)),
    Tab(icon: Icon(Icons.feedback))
  ];

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Image.asset('assets/images/nti.png', fit: BoxFit.scaleDown),
          ),
          backgroundColor: NTIblue,
          title: Center(child: Text("Matapp", style: AppbarTextStyle)),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 20, 5),
              child: Icon(Icons.settings),
            ),
          ],
        ),
        bottomNavigationBar: new Material(
          color: NTIblue,
          child: new TabBar(
            controller: controller,
            tabs: myTabs,
          ),
        ),
        body: new TabBarView(controller: controller, children: <Widget>[
          new feedback.Page(),
          new menu.Page()
        ]) ,
      ),
    );
  }
}