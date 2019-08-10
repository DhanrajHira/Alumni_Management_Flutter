import 'package:flutter/material.dart';
import '../allpage.dart';

class AppSideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Veiw All Records'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllPage(),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
