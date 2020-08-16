import 'package:flutter/material.dart';
import 'clock.dart';
void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage(),
      theme: ThemeData(
        fontFamily:"GoogleSans"
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
