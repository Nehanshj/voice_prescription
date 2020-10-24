import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text_provider.dart';
import 'package:voicepres/provider/prescription_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  String _currentLocaleId = "Select";

  @override
  void initState() {
    super.initState();
  }

  void _setCurrentLocale(SpeechToTextProvider speechProvider) {
    if (speechProvider.isAvailable) {
      _currentLocaleId = speechProvider.systemLocale.localeId;
      print("Current Locale:$_currentLocaleId");
    }
  }

  @override
  Widget build(BuildContext context) {
    var speechProvider = Provider.of<SpeechToTextProvider>(context);
    var document = Provider.of<PrescriptionProvider>(context);
    if (_currentLocaleId == "Select") _setCurrentLocale(speechProvider);

    PopUp() {
      _switchLang(selectedVal) {
        setState(() {
          _currentLocaleId = selectedVal;
        });
        print(selectedVal);
        print(_currentLocaleId);
      }

      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)), //this right here
        child: Container(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton(
                  onChanged: (selectedVal) => _switchLang(selectedVal),
                  value: _currentLocaleId,
                  items: speechProvider.locales
                      .map(
                        (localeName) =>
                        DropdownMenuItem(
                          value: localeName.localeId,
                          child: Text(localeName.name),
                        ),
                  )
                      .toList(),
                ),
                SizedBox(
                  width: 320.0,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: const Color(0xFF1BC0C5),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Colors.teal,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
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
                leading: Icon(Icons.format_color_text),
                title: Text("Change Language"),
                onTap: () =>
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return PopUp();
                        }
                    )
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
                            document.initPres();
                            Navigator.of(context).pushNamed("/tab");
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