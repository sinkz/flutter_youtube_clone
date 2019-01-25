import 'package:flutter/material.dart';
import 'package:youtube_favoritos/api.dart';
import 'package:youtube_favoritos/screens/home.dart';

void main() {

  Api api = Api();
  api.search("eletro");
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'FlutterTube', home: Home());
  }
}
