import 'package:base/helpers/customroutetransition.dart';
import 'package:base/queryresultview.dart';
import 'package:flutter/material.dart';

class QueryView extends StatefulWidget {
  @override
  _QueryViewState createState() => _QueryViewState();
}

class _QueryViewState extends State<QueryView> {
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  String dropdownValue;
  String searchvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Query Database'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                child: DropdownButton<String>(
              hint: Text('Select a field to search'),
              value: dropdownValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>[
                'Alu_ID',
                'First_name',
                'Last_name',
                'DOB',
                'Gender',
                'Correspondance_Address',
                'Office_Address',
                'EmailID',
                'Mobile_No',
                'Current_city',
                'Current_company',
                'Designation',
                'Session_from',
                'Session_to',
                'Branch'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Search'),
                      onChanged: (String value) {
                        searchvalue = value;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: searchdb,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void searchdb() {
    if (dropdownValue == null) {
      _scaffoldkey.currentState.showSnackBar(SnackBar(
        content: Text('Please select a search by field'),
      ));
      return;
    }
    Navigator.push(
        context,
        CustomRoute(
            builder: (context) => QueryResultView(
                  searchfieldname: dropdownValue,
                  searchvalue: searchvalue,
                )));
  }
}
