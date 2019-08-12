import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'helpers/customroutetransition.dart';
import 'updateview.dart';
import 'DbProvider.dart';

class BookmarkedView extends StatefulWidget {
  @override
  _BookmarkedViewState createState() => _BookmarkedViewState();
}

class _BookmarkedViewState extends State<BookmarkedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarked'),
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(snapshot.data[index].firstname[0]),
                ),
                title: snapshot.data[index].firstname,
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => Navigator.push(
                    context,
                    SlideUpRoute(
                      builder: (context) => UpdateView(
                        alumni: snapshot.data[index],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<List> getbookmarked(){
    var db = Provider.of<DBProvider>(context);
  }
}
