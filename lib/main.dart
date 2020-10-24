import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text_provider.dart';
import 'package:voicepres/tab_page.dart';

import 'home_screen.dart';
import 'provider/prescription_provider.dart';

void main() => runApp(VoicePress());

class VoicePress extends StatefulWidget {
  @override
  _VoicePressState createState() => _VoicePressState();
}

class _VoicePressState extends State<VoicePress> {
  final SpeechToText speech = SpeechToText();
  SpeechToTextProvider speechProvider;

  @override
  void initState() {
    speechProvider = SpeechToTextProvider(speech);
    super.initState();
    initSpeechState();
  }

  Future<void> initSpeechState() async {
    await speechProvider.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: PrescriptionProvider(),
        ),
        ChangeNotifierProvider<SpeechToTextProvider>.value(
          value: speechProvider,
        ),
      ],
      child: MaterialApp(
        title: 'Voice Prescription App',
        home: HomeScreen(),
        routes: <String, WidgetBuilder>{
          "/home": (BuildContext context) => HomeScreen(),
          "/tab": (BuildContext context) => TabPage(),
//            "/personal": (BuildContext context) => NewPage(),
//            "/diagnosis": (BuildContext context) => DiagonsisPage(),
//            "/prescription": (BuildContext context) => PrescriptionPage(),
//            "/remarks": (BuildContext context) => ExtraRemarks(),
//            "/advice": (BuildContext context) => Advice(),
        },
        initialRoute: "/home",
      ),
    );
  }
}
