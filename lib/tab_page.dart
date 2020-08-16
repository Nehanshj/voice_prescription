import 'package:flutter/material.dart';
import 'package:voicepres/tabs/1_personal_details.dart';
import 'package:voicepres/tabs/2_diagnosis.dart';
import 'package:voicepres/tabs/3_prescription.dart';
import 'package:voicepres/tabs/4_advice.dart';
import 'package:voicepres/tabs/5_extra_remarks.dart';


class TabPage extends StatefulWidget {
//int selectedPage;
//TabPage(this.selectedPage);
  const TabPage({Key key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with TickerProviderStateMixin {
//  final GlobalKey<_TabPageState> tabpage = new GlobalKey<_TabPageState>();

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 5, initialIndex: 0);
  }

//
//  @override
//  void dispose() {
//    _tabController.dispose();
//    super.dispose();
//  }
//

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      NewPage(_tabController),
      DiagonsisPage(_tabController),
      PrescriptionPage(_tabController),
      Advice(_tabController),
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
        initialIndex: 0,
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
              controller: _tabController,
              isScrollable: true,
              tabs: _kTabs,
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: _kTabPages,
          ),
        ));
  }
}
