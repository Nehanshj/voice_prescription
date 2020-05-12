import 'package:flutter/material.dart';
import 'home_screen.dart';

class Advice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          color: Colors.tealAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
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
                      'Advice & Remarks',
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
                height: 20.0,
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
                            MaterialPageRoute(builder: (context) => Advice()));
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
              SizedBox(
                height: 63.0,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Center(
                    child: Text(
                      "GENERATE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  color: Colors.red,
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  height: 100.0,
                ),
              ),
            ],
          ),
        ));
  }
}
