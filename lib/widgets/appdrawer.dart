import 'package:flutter/material.dart';
import '../queryview.dart';
import '../allview.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.list),
            title: Text('All Records'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => AllView()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Query'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => QueryView()),
            ),
          ),
        ],
      ),
    );
  }
}
