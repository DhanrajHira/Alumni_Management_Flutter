import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'recordview.dart';
import 'updateview.dart';
import 'DBprovider.dart';

class QueryResultView extends StatefulWidget {
  final String searchfieldname;
  final String searchvalue;

  QueryResultView({this.searchfieldname, this.searchvalue});

  @override
  _QueryResultViewState createState() => _QueryResultViewState();
}

class _QueryResultViewState extends State<QueryResultView> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DBProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: FutureBuilder(
        future: db
            .searchrecords(searchby: widget.searchfieldname, searchvalue: widget.searchvalue),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data.length == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.error,
                    size: 50,
                  ),
                  Text('No matching result found'),
                ],
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Hero(
                  tag: snapshot.data[index].aluid,
                  child: CircleAvatar(
                    child: Text(snapshot.data[index].firstname[0]),
                  ),
                ),
                title: Text(snapshot.data[index].firstname),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => RecordView(
                      alumni: snapshot.data[index],
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => UpdateView(
                        alumni: snapshot.data[index],
                      ),
                    ),
                  ).then<void>((didupdate) {
                    print(didupdate);
                    if (didupdate == true) {
                      setState(() {});
                    }
                  }),
                ),
              );
            },
            itemCount: snapshot.data.length,
          );
        },
      ),
    );
  }
}
