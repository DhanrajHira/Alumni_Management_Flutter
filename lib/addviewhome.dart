import 'package:flutter/material.dart';

import 'package:sql/widgets/appdrawer.dart';
import 'widgets/addview.dart';

class AddViewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Alumni Record'),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AddView(),
        )),
        drawer: AppDrawer(),
      ),
    );
  }
}
