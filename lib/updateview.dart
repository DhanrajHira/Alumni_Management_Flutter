import 'package:base/DBprovider.dart';
import 'package:base/models/alumni.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateView extends StatefulWidget {
  final Alumni alumni;
  UpdateView({@required this.alumni});

  @override
  _UpdateViewState createState() => _UpdateViewState(alumni.aluid);
}

class _UpdateViewState extends State<UpdateView> {
  final _formkey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  final String id;
  _UpdateViewState(this.id);

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
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Update Record'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: deleterecord,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
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
                  initialValue: widget.alumni.firstname,
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
                  initialValue: widget.alumni.lastname,
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
                  initialValue: widget.alumni.dob,
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
                  initialValue: widget.alumni.gender,
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Correspondance Address'),
                  onSaved: (String value) {
                    corradd = value;
                  },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                  initialValue: widget.alumni.corradd,
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
                  initialValue: widget.alumni.offadd,
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
                  initialValue: widget.alumni.email,
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
                  initialValue: widget.alumni.mobile,
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
                  initialValue: widget.alumni.currcity,
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
                  initialValue: widget.alumni.currcomp,
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
                  initialValue: widget.alumni.desg,
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
                  initialValue: widget.alumni.sesfrom,
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
                  initialValue: widget.alumni.sesto,
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
                  initialValue: widget.alumni.branch,
                ),
                RaisedButton(
                  child: Text('Update'),
                  onPressed: updaterecord,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updaterecord() {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();
    updaterecordinsql();
  }

  void updaterecordinsql() {
    final db = Provider.of<DBProvider>(context, listen: false);
    final Alumni updatedalumni = Alumni(
        aluid: widget.alumni.aluid,
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
    db.updaterecord(updatedalumni);
    print(updatedalumni.lastname);
    Navigator.pop(context, true);
  }

  void deleterecord() {
    final db = Provider.of<DBProvider>(context, listen: false);
    db.deleterecord(widget.alumni);
    Navigator.pop(context, true);
  }
}
