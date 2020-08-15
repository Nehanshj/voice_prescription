import 'package:flutter/material.dart';
import 'package:voicepres/tabs/1_personal_details.dart';
import 'package:voicepres/tabs/2_diagnosis.dart';
import 'package:voicepres/tabs/3_prescription.dart';
import 'package:voicepres/tabs/4_advice.dart';
import 'package:voicepres/tabs/5_extra_remarks.dart';


class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      NewPage(),
      DiagonsisPage(),
      PrescriptionPage(),
      Advice(),
      ExtraRemarks()
    ];

    final _kTabs = <Tab>[
      Tab(text: 'Personal Details'),
      Tab(text: 'Diagnosis'),
      Tab(text: 'Prescription'),
      Tab(text: 'Advice'),
      Tab(text: 'Remarks'),
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
