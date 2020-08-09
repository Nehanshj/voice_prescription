//first page after the New Prescription button is pressed in the home screen.

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'package:voicepres/Prescription.dart';
import 'package:voicepres/home_screen.dart';


class NewPage extends StatefulWidget {
  const NewPage({
    Key key,
}) : super(key : key);

  @override
  _NewPageState createState() => _NewPageState();
}
class _NewPageState extends State<NewPage> {
  bool _hasSpeech = false;
  double level = 0.0; //variables to be used by STT
  String lastWords = ""; //variable used for the STT result output
  String lastError = "";
  String lastStatus = "";
  String _currentLocaleId = "";
  final SpeechToText speech = SpeechToText(); //STT object initialization

  final _controller = TextEditingController(); //controller to get the recognised text in textfield

  @override
  void initState() {
    super.initState();
    initSpeechState(); //starting the STT as soon as the screen loads
    _controller.addListener(() {
      final text = _controller.text;
      _controller.value = _controller.value.copyWith(
        text:
        lastWords,
        //passing the recognised text from text widget to textfield widget
        selection: TextSelection(
            baseOffset: text.length, extentOffset: text.length),
        //idk
        composing: TextRange.empty,
      );
    });
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);
    if (hasSpeech) {
      var systemLocale = await speech
          .systemLocale(); //taking current system locale i.e. English
      _currentLocaleId = systemLocale.localeId;
    }

    if (!mounted) return;

    setState(() {
      _hasSpeech = hasSpeech;
    });
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
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
        ],
        title: Text('VOICE PRESCRIPTION'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 20.0),
          color: Colors.lightBlueAccent,
          child: Column(children: <Widget>[
            Text(
              'Enter Personal Details',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: 'Verdana',
              ),
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
                      "Name",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                    GestureDetector(
                      //to detect taps to toggle
                        onTap: change,
                        child: toggle
                            ? Text(
                          lastWords,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.blueAccent,
                          ),
                        )
                            : TextField(
                          controller: _controller,
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      //3 button ROW
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 60,
                          child: FloatingActionButton(
                            onPressed:
                            speech.isListening ? stopListening : null,
                            mini: true,
                            heroTag:
                            null,
                            //3 FAB cant be used together without this
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
                            onPressed: startListening,
                            heroTag: "start",
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.mic,
                              color: speech.isListening
                                  ? Colors.green
                                  : Colors.blue,
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
                              resetValuesAfterSubmit(); // code at the end of this page
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) {
                                        return PrescriptionPage();
                                      }
                                      )
                              );// NavigatorPush
                            }, //onPressed
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
          ])),
    );
  }

//Functions used for STT
  void startListening() {
    lastWords = "";
    lastError = "";
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 10),
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        partialResults: true);
    setState(() {});
  }

  void stopListening() {
    speech.stop();
    setState(() {
      level = 0.0;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    //Result of STT
    setState(() {
      //lastWords = result.recognizedWords;
      lastWords = "${result.recognizedWords} - ${result.finalResult}";
    });
  }

  void soundLevelListener(double level) {
    setState(() {
      this.level = level;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void statusListener(String status) {
    setState(() {
      lastStatus = "$status";
    });
  }

  // line number 216 code.
  void resetValuesAfterSubmit() {
    setState(() {
      _controller.clear();
    });
  }
}

