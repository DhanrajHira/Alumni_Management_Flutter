import 'package:flutter/material.dart';
import 'package:sql/updateview.dart';
import 'models/student.dart';
import 'DbProvider.dart';
import 'recordview.dart';

class AllView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alumni Record'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              DBProvider.db.cleardatabase();
              Navigator.pop(context, true);
            },
          )
        ],
      ),
      body: FutureBuilder<List<Student>>(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return FutureBuilder(
            future: DBProvider.db.getallrecords(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    String title = snapshot.data[index].firstname;
                    return ListTile(
                      leading: Hero(
                        tag: snapshot.data[index].aluid,
                        child: CircleAvatar(
                          child: Text(snapshot.data[index].firstname[0]),
                        ),
                      ),
                      title: Text(
                        title,
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => RecordView(
                                    student: snapshot.data[index],
                                  ))),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateView(
                                student: snapshot.data[index],
                              ),
                            )),
                      ),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
