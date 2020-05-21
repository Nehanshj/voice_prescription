/*
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

import 'models/database.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory(); // initializing path provider
  Hive.init(appDocumentDir.path); // initializing Hive with path
  Hive.registerAdapter(DatabaseAdapter(),0); // supports database.g.dart
  runApp(VoicePress());
}

class VoicePress extends StatefulWidget {
  @override
  _VoicePressState createState() => _VoicePressState();
}

class _VoicePressState extends State<VoicePress> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Voice Prescription App',
        home: HomeScreen()
      ),
    );
  }

  @override
  void dispose() {
    Hive.box('database').compact();
    Hive.close();
    super.dispose();
  } // closing the box
}
 */