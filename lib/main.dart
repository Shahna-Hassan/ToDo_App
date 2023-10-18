import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lumi_todo/model/notes_model.dart';
import 'package:lumi_todo/view/home_screen/home_screen.dart';
Future<void> main() async {
  await Hive.initFlutter();
  var box=await Hive.openBox('noteBox');
  Hive.registerAdapter(NoteModelAdapter());
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}