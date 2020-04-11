import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() => runApp(VoicePress());

class VoicePress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice Prescription App',
      home: HomeScreen(),
    );
  }
}
