import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text_provider.dart';
import '../home_screen.dart';

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
              Icon(Icons.keyboard_voice,
                color: speechProvider.isListening ? Colors.green : Colors.blue,
                size: 60.0,
              ),

              ///Go Ahead
              FloatingActionButton(
                child: Icon(Icons.check,
                  color: Colors.green,
                  size: 40.0,
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  {
                    return ExtraRemarks(); // jahaan bhi jaana hai chale jaana
                  }));
                },
              )
            ]),

        body: Container(
          color: Colors.blue,
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
                      'Remarks',
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
                            MaterialPageRoute(builder: (context) => ExtraRemarks()));
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
              RaisedButton(
                onPressed: () {
                },
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