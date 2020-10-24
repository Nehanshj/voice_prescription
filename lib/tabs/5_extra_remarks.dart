import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text_provider.dart';
import 'package:voicepres/provider/prescription_provider.dart';

class ExtraRemarks extends StatefulWidget{
  @override
  _ExtraRemarksState createState() {
    return _ExtraRemarksState();
  }
}

class _ExtraRemarksState extends State<ExtraRemarks> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  String extraRemarks; // Var for extra remarks`

  String diagnosis;
  String prescription;
  bool _hasSpeech = false;
  double level = 0.0; //variables to be used by STT
  String lastWords = ""; //variable used for the STT result output
  String lastError = "";
  String lastStatus = "";
  String _currentLocaleId = "";
  final SpeechToText speech = SpeechToText(); //STT object initialization
  TextEditingController _lastcontroller =
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
    var document = Provider.of<PrescriptionProvider>(context);

    _lastcontroller.text = " ";
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
//              Navigator.of(context).pushNamed("/detail");
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
              Icon(
                Icons.keyboard_voice,
                color: speechProvider.isListening ? Colors.green : Colors.blue,
                size: 60.0,
              ),

              ///Go Ahead
              IconButton(
                icon: Icon(
                  Icons.insert_drive_file,
                  color: Colors.green,
                  size: 40.0,
                ),
                onPressed: () {
                  document.addData(
                      "remark", speechProvider.lastResult.recognizedWords);
                  document.generate();
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          backgroundColor: Colors.amber,
                          child: Container(
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Generating Prescription"),
                                  CircularProgressIndicator(
                                    strokeWidth: 8,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
//                  Navigator.push(context, MaterialPageRoute(builder: (context)
//                  {
//                    return ExtraRemarks(); // jahaan bhi jaana hai chale jaana
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
                  'Enter Remarks',
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
                          controller: _lastcontroller,
                        )),
                    SizedBox(
                      height: 20.0,
                      width: 300,
                    ),
                  ],
                )),
          ])),);
  }
}