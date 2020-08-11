import 'package:flutter/material.dart';
import 'package:voicepres/Prescription.dart';

import 'advice.dart';
import 'newPage.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      NewPage(),
      PrescriptionPage(),
      Advice(),
      Container(),
      Container()
    ];

    final _kTabs = <Tab>[
      Tab(text: 'Personal Details'),
      Tab(text: 'Diagnosis'),
      Tab(text: 'Prescription'),
      Tab(text: 'Advice'),
      Tab(text: 'Extra Remarks'),
    ];

    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.settings_voice),
            //Image.asset("assets/Macarbi Logo.jpg"),//TODO image or icon here
            title: Text("Voice Prescription"),
            centerTitle: true,
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.search),
//            onPressed: () {},//TODO  do something
//          ),
//          IconButton(
//            icon: Icon(Icons.account_circle),
//            onPressed: () {},//TODO do something
//          ),
//        ],
            bottom: TabBar(
              isScrollable: true,
              tabs: _kTabs,
            ),
          ),
          body: TabBarView(
            children: _kTabPages,
          ),
        ));
  }
}
