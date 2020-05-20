import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'models/database.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(DatabaseAdapter(),0);
  runApp(VoicePress());
}

class VoicePress extends StatefulWidget {
  @override
  _VoicePressState createState() => _VoicePressState();
}

class _VoicePressState extends State<VoicePress> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice Prescription App',
      home: HomeScreen()
    );
  }

  @override
  void dispose() {
    Hive.box('database').compact();
    Hive.close();
    super.dispose();
  }
}