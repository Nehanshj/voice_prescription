import 'package:flutter/material.dart';

import 'advice.dart';
import 'home_screen.dart';

class PrescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade300,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
            },
          ),
        ],
        title: Text('VOICE PRESCRIPTION'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 20.0),
          color: Colors.lightBlueAccent,
          child: Column(
            children: <Widget>[
              /*Text('Enter Personal Details',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Verdana',
                ),),*/
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Diagnosis",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Prescription',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(
                      height: 120.0,
                    ),
                    TextField(),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    child: FloatingActionButton(
                      onPressed: null,
                      mini: true,
                      heroTag: null,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.stop,
                        size: 40.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    child: FloatingActionButton(
                      onPressed: null,
                      heroTag: "start",
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.mic,
                        color: Colors.blue,
                        size: 40.0,
                      ),
                      autofocus: true,
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return Advice();
                            }));
                      },
                      mini: true,
                      heroTag: null,
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.check,
                        size: 40.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
