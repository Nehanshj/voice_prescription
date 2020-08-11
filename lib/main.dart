import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text_provider.dart';

import 'home_screen.dart';

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
    return ChangeNotifierProvider<SpeechToTextProvider>.value(
        value: speechProvider,
        child: MaterialApp(
          title: 'Voice Prescription App',
          home: HomeScreen(),
        ));
  }
}
