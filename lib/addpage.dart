import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DBprovider.dart';
import 'queryview.dart';
import 'allpage.dart';
import 'helpers/customroutetransition.dart';
import 'models/alumni.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Record'),
        ),
        drawer: Drawer(
          child: Column(children: <Widget>[
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Veiw All Records'),
              onTap: () => Navigator.push(
                context,
                SlideUpRoute(
                  builder: (context) => AllPage(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Query'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QueryView())),
            )
          ]),
        ),
        body: SingleChildScrollView(child: BuildForm()));
  }
}

class BuildForm extends StatefulWidget {
  @override
  _BuildFormState createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
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
    Provider.of<DBProvider>(context).readbookmarked();
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }

  void savedata() {
    if (!_formkey.currentState.validate()) {
      return null;
    }
    _formkey.currentState.save();
    final Alumni newalumni = Alumni(
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
    final db = Provider.of<DBProvider>(context, listen: false);
    db.addrecord(newalumni);
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Saved'),
    ));
    _formkey.currentState.reset();
  }
}
