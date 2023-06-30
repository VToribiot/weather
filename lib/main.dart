import 'package:flutter/material.dart';
import 'package:wae/screens/location.dart';
import 'package:wae/screens/city.dart';

import 'screens/loading.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: loadingPage()
      ),
    );
  }
}
