import 'package:flutter/material.dart';
import 'package:kuis_prakpam_124200024/daftar_belanjaan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: DaftarBelanjaan(),
    );
  }
}
