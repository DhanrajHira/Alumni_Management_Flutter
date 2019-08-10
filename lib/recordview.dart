import 'package:base/models/alumni.dart';
import 'package:flutter/material.dart';

import './widgets/record_fielddata.dart';
import './widgets/record_fieldname.dart';

class RecordView extends StatefulWidget {
  final Alumni alumni;
  RecordView({@required this.alumni});

  @override
  _RecordViewState createState() => _RecordViewState();
}

class _RecordViewState extends State<RecordView> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _slideanimation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    _slideanimation = Tween<Offset>(
            begin: Offset(0.0, 1.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    runanimations();
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            title: Text(widget.alumni.firstname),
            background: Hero(
              tag: widget.alumni.aluid,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ),
          expandedHeight: 180.0,
          pinned: true,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          SlideTransition(
              child: FadeTransition(opacity: CurvedAnimation(parent: _controller, curve: Curves.easeIn),child: RecordViewFieldName('Alu ID')), position: _slideanimation),
          RecordFieldData(widget.alumni.aluid),
          RecordViewFieldName('First Name'),
          RecordFieldData(widget.alumni.firstname),
          RecordViewFieldName('Last Name'),
          RecordFieldData(widget.alumni.lastname),
          RecordViewFieldName('Date of Birth'),
          RecordFieldData(widget.alumni.dob),
          RecordViewFieldName('Gender'),
          RecordFieldData(widget.alumni.gender),
          RecordViewFieldName('Correspondance Address'),
          RecordFieldData(widget.alumni.corradd),
          RecordViewFieldName('Office Address'),
          RecordFieldData(widget.alumni.offadd),
          RecordViewFieldName('Email Address'),
          RecordFieldData(widget.alumni.email),
          RecordViewFieldName('Mobile Number'),
          RecordFieldData(widget.alumni.mobile),
          RecordViewFieldName('Current City'),
          RecordFieldData(widget.alumni.currcity),
          RecordViewFieldName('Current Company'),
          RecordFieldData(widget.alumni.currcomp),
          RecordViewFieldName('Designation'),
          RecordFieldData(widget.alumni.desg),
          RecordViewFieldName('Session from'),
          RecordFieldData(widget.alumni.sesfrom),
          RecordViewFieldName('Session to '),
          RecordFieldData(widget.alumni.sesto),
          RecordViewFieldName('Branch'),
          RecordFieldData(widget.alumni.branch),
        ])),
      ],
    ) /*ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            height: 200,
            width: 200,
            child: Hero(
              tag: alumni.aluid,
              child: CircleAvatar(
                child: Text(
                  alumni.firstname[0],
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          RecordViewFieldName('Alu ID'),
          RecordFieldData(alumni.aluid),
          RecordViewFieldName('First Name'),
          RecordFieldData(alumni.firstname),
          RecordViewFieldName('Last Name'),
          RecordFieldData(alumni.lastname),
          RecordViewFieldName('Date of Birth'),
          RecordFieldData(alumni.dob),
          RecordViewFieldName('Gender'),
          RecordFieldData(alumni.gender),
          RecordViewFieldName('Correspondance Address'),
          RecordFieldData(alumni.corradd),
          RecordViewFieldName('Office Address'),
          RecordFieldData(alumni.offadd),
          RecordViewFieldName('Email Address'),
          RecordFieldData(alumni.email),
          RecordViewFieldName('Mobile Number'),
          RecordFieldData(alumni.mobile),
          RecordViewFieldName('Current City'),
          RecordFieldData(alumni.currcity),
          RecordViewFieldName('Current Company'),
          RecordFieldData(alumni.currcomp),
          RecordViewFieldName('Designation'),
          RecordFieldData(alumni.desg),
          RecordViewFieldName('Session from'),
          RecordFieldData(alumni.sesfrom),
          RecordViewFieldName('Session to '),
          RecordFieldData(alumni.sesto),
          RecordViewFieldName('Branch'),
          RecordFieldData(alumni.branch),
        ],
          ),*/
        );
  }
  void runanimations(){
    _controller.forward();
  }
}
