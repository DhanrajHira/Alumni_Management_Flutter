import 'package:flutter/material.dart';

class SearchByList extends StatefulWidget {
  @override
  SearchByListState createState() => SearchByListState();
}

class SearchByListState extends State<SearchByList> {
  String dropdownValue = 'Alu_ID';
  @override
  Widget build(BuildContext context) {
    return Container(
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
    ));
  }
}
