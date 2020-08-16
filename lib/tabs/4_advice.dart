import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text_provider.dart';

class Advice extends StatefulWidget {
  TabController controller;

  Advice(this.controller);

  @override
  _AdviceState createState() {
    return _AdviceState();
  }
}

class _AdviceState extends State<Advice> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  String advice; // Var for advice`

  String diagnosis;
  String prescription;
  bool _hasSpeech = false;
  double level = 0.0; //variables to be used by STT
  String lastWords = ""; //variable used for the STT result output
  String lastError = "";
  String lastStatus = "";
  String _currentLocaleId = "";
  final SpeechToText speech = SpeechToText(); //STT object initialization
  TextEditingController _controller =
  TextEditingController(); //controller to get the recognised text in textfield

  @override
  void initState() {
    super.initState();
  }

  bool toggle = true;

  void change() {
    //to change from text to textfield
    setState(() {
      toggle = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var speechProvider = Provider.of<SpeechToTextProvider>(context);
    _controller.text = " ";
    int index = 0;

    switchIndex(int ind) {
      setState(() {
        index = ind;
      });
      print(index);
    }

    return Scaffold(
      ///bottom bar
        bottomNavigationBar: CurvedNavigationBar(
            index: index,
            height: 60.0,
            color: Colors.white,
            buttonBackgroundColor: Colors.white,
            backgroundColor: Colors.blueAccent,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),

            ///Functions performed
            onTap: (index) {
              if (index == 1) {
                !speechProvider.isAvailable || speechProvider.isListening
                    ? null
                    : speechProvider.listen(partialResults: true);
              } else if (index == 0) {
                speechProvider.isListening ? speechProvider.stop() : null;
              } else if (index == 2) {
                widget.controller.animateTo(4);
              }
              switchIndex(index);
            },
            items: [

              ///STOP
              Icon(Icons.stop,
                color: Colors.redAccent,
                size: 40.0,
              ),

              ///Voice
              Icon(Icons.keyboard_voice,
                color: speechProvider.isListening ? Colors.green : Colors.blue,
                size: 60.0,
              ),

              ///Go Ahead
              IconButton(
                icon: Icon(Icons.check,
                  color: Colors.green,
                  size: 40.0,
                ),
                onPressed: () {
                  widget.controller.animateTo(4);
//                  Navigator.push(context, MaterialPageRoute(builder: (context)
//                  {
//                    return ExtraRemarks();
//                  }));
                },
              )
            ]),

      body: Container(
          padding: EdgeInsets.only(top: 20.0),
          color: Colors.blue,
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Enter Advice',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Verdana',
                  ),
                ),

                ///Recording GIF
                speechProvider.isListening ? Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/5/53/Loading-red-spot.gif',
                  height: 50.0, width: 50.0,) : Text(""),
              ],
            ),
            Card(
              //Main Area
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
                      "Advice",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                    GestureDetector(
                      //to detect taps to toggle
                        onTap: change,
                        child: toggle
                            ? speechProvider.hasResults
                            ? Text(
                          speechProvider.lastResult.recognizedWords,
                          textAlign: TextAlign.center,
                        )
                            : Container()
                            : TextField(
                          controller: _controller,
                        )),
                    SizedBox(
                      height: 20.0,
                      width: 300,
                    ),
                  ],
                )),
          ])),
        );
  }
}