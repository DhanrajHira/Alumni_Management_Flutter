import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './DBprovider.dart';
import './addpage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DBProvider>.value(value: DBProvider(), child: MaterialApp(
      home: AddPage(),
    ),);
  }
}