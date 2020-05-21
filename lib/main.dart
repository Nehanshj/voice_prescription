import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voicepres/data/moor_database.dart';

import 'home_screen.dart';

void main() => runApp(VoicePress());

class VoicePress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => AppDatabase(),
        child: MaterialApp(
          title: 'Voice Prescription App',
          home: HomeScreen(),
        ),
    );
  }
}
