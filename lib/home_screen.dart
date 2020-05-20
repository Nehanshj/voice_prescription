import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:voicepres/main.dart';
import 'package:voicepres/newPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Colors.teal,
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text(
                'Voice Prescription',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.filter_list),
              title: Text('Prescription Record'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Doctor Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('About the App'),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, right: 30.0, left: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: null,
                  foregroundColor: Colors.teal,
                  onPressed: () => _scaffoldkey.currentState.openDrawer(),
                  child: Icon(Icons.list),
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Voice Prescription',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 10.0),
                  child: Text('Prescription Count',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80.0),
                      topRight: Radius.circular(80.0),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        height: 100.0,
                        width: 100.0,
                        child: FloatingActionButton.extended(
                          heroTag: 'start',
                          label: Text(
                            'New Prescription',
                            style:
                            TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                            FutureBuilder(
                              future: Hive.openBox('database'),
                              //ignore: missing_return
                              builder: (BuildContext context, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  if (snapshot.hasError)
                                    return Text(snapshot.hasError.toString());
                                  else
                                      return NewPage();
                                }
                                else
                                  return HomeScreen();
                              },
                            );
                            return NewPage();
                                }));
                          },
                          elevation: 35.0,
                          highlightElevation: 10.0,
                          backgroundColor: Colors.teal,
                          icon: Icon(
                            Icons.create,
                            size: 70.0,
                          ),
                        )),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}