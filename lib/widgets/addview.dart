import 'package:flutter/material.dart';
import 'package:sql/models/student.dart';
import '../DbProvider.dart';

class AddView extends StatefulWidget {
  Map datamap = {
    'Alu_ID': '',
    'First_name': '',
    'Last_name': '',
    'DOB': '',
    'Gender': '',
    'Correspondance_Address': '',
    'Office_Address': '',
    'EmailID': '',
    'Mobile_No': '',
    'Current_city': '',
    'Current_company': '',
    'Designation': '',
    'Session_from': '',
    'Session_to': '',
    'Branch': '',
  };
  AddView({this.datamap});
  @override
  _AddViewState createState() => _AddViewState(datamap);
}

class _AddViewState extends State<AddView> {
  Map datamap;
  _AddViewState(this.datamap);
  final _formkey = GlobalKey<FormState>();

  String aluid;
  String firstname;
  String lastname;
  String dob;
  String gender;
  String corradd;
  String offadd;
  String email;
  String mobile;
  String currcity;
  String currcomp;
  String desg;
  String sesto;
  String sesfrom;
  String branch;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'First name'),
            onSaved: (String value) {
              firstname = value;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'This field must not be empty';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Last name'),
            onSaved: (String value) {
              lastname = value;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'This field must not be empty';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Date of Birth'),
            onSaved: (String value) {
              dob = value;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'This field must not be empty';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Gender'),
            onSaved: (String value) {
              gender = value;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'This field must not be empty';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Correspondance Address'),
            onSaved: (String value) {
              corradd = value;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'This field must not be empty';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Office Address'),
            onSaved: (String value) {
              offadd = value;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'This field must not be empty';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Email ID '),
            onSaved: (String value) {
              email = value;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'This field must not be empty';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Mobile Number '),
            onSaved: (String value) {
              mobile = value;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'This field must not be empty';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Current City'),
            onSaved: (String value) {
              currcity = value;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'This field must not be empty';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Current Company'),
            onSaved: (String value) {
              currcomp = value;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'This field must not be empty';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Designation'),
            onSaved: (String value) {
              desg = value;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'This field must not be empty';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Session From'),
            onSaved: (String value) {
              sesfrom = value;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'This field must not be empty';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Session To'),
            onSaved: (String value) {
              sesto = value;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'This field must not be empty';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Branch'),
            onSaved: (String value) {
              branch = value;
            },
            validator: (String value) {
              if (value.isEmpty) {
                return 'This field must not be empty';
              }
              return null;
            },
          ),
          RaisedButton(
            child: Text('Save'),
            onPressed: savedata,
          )
        ],
      ),
    );
  }

  savedata() {
    if (!_formkey.currentState.validate()) {
      return '';
    }

    _formkey.currentState.save();
    inputdatatosql();
  }

  void inputdatatosql()  {
    Student newalumni = Student(
        aluid: null,
        branch: branch,
        corradd: corradd,
        currcity: currcity,
        currcomp: currcomp,
        desg: desg,
        dob: dob,
        email: email,
        firstname: firstname,
        gender: gender,
        lastname: lastname,
        mobile: mobile,
        offadd: offadd,
        sesfrom: sesfrom,
        sesto: sesto);

    DBProvider.db.addrecord(newalumni);
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Saved'),
      duration: Duration(seconds: 2),
    ));
    _formkey.currentState.reset();
  }
}
