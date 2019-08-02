import 'package:flutter/material.dart';
import 'package:sql/widgets/record_fieldname.dart';
import './models/student.dart';
import './widgets/record_fielddata.dart';

class RecordView extends StatelessWidget {
  final Student student;
  RecordView({@required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.firstname),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            height: 200,
            width: 200,
            child: Hero(
              tag: student.aluid,
              child: CircleAvatar(
                child: Text(
                  student.firstname[0],
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          RecordViewFieldName('Alu ID'),
          RecordFieldData(student.aluid),
          RecordViewFieldName('First Name'),
          RecordFieldData(student.firstname),
          RecordViewFieldName('Last Name'),
          RecordFieldData(student.lastname),
          RecordViewFieldName('Date of Birth'),
          RecordFieldData(student.dob),
          RecordViewFieldName('Gender'),
          RecordFieldData(student.gender),
          RecordViewFieldName('Correspondance Address'),
          RecordFieldData(student.corradd),
          RecordViewFieldName('Office Address'),
          RecordFieldData(student.offadd),
          RecordViewFieldName('Email Address'),
          RecordFieldData(student.email),
          RecordViewFieldName('Mobile Number'),
          RecordFieldData(student.mobile),
          RecordViewFieldName('Current City'),
          RecordFieldData(student.currcity),
          RecordViewFieldName('Current Company'),
          RecordFieldData(student.currcomp),
          RecordViewFieldName('Designation'),
          RecordFieldData(student.desg),
          RecordViewFieldName('Session from'),
          RecordFieldData(student.sesfrom),
          RecordViewFieldName('Session to '),
          RecordFieldData(student.sesto),
          RecordViewFieldName('Branch'),
          RecordFieldData(student.branch),
        ],
      ),
    );
  }
}
