import 'package:base/helpers/customroutetransition.dart';
import 'package:base/recordview.dart';
import 'package:base/updateview.dart';
import 'package:flutter/material.dart';
import 'DBprovider.dart';
import 'package:provider/provider.dart';

class AllPage extends StatefulWidget {
  @override
  _AllPageState createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  var db;

  @override
  Widget build(BuildContext context) {
    db = Provider.of<DBProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('All Records'),
      ),
      body: FutureBuilder(
        future: db.getallrecords(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Hero(
                  tag: snapshot.data[index].aluid,
                  child: CircleAvatar(
                      child: Text(snapshot.data[index].firstname[0])),
                ),
                title: Text(snapshot.data[index].firstname),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => Navigator.push(
                      context,
                      CustomRoute(
                          builder: (context) =>
                              UpdateView(alumni: snapshot.data[index]))),
                ),
                onTap: () => Navigator.push(
                  context,
                  CustomRoute(
                    builder: (context) => RecordView(
                      alumni: snapshot.data[index],
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
}
