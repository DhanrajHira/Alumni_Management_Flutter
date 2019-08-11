import 'package:base/models/alumni.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './widgets/recordviewbody.dart';
import 'helpers/recordviewanimations.dart';

class RecordView extends StatefulWidget {
  final Alumni alumni;
  RecordView({@required this.alumni});

  @override
  _RecordViewState createState() => _RecordViewState();
}

class _RecordViewState extends State<RecordView> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _slideanimation;
  Animation<double> _opacityanimation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    _slideanimation = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _opacityanimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    super.initState();
  }

  void runanimations() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    runanimations();
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.alumni.firstname,
              ),
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
            RecordViewSlideFadeTransition(
              slideanimation: _slideanimation,
              opacityanimation: _opacityanimation,
              child: FieldCategory(
                categoryicon: Icons.person,
                widgets: <Widget>[
                  RecordData(
                    fieldname: 'First Name',
                    fieldvalue: widget.alumni.firstname,
                  ),
                  RecordData(
                    fieldname: 'Last Name',
                    fieldvalue: widget.alumni.lastname,
                  ),
                  RecordData(
                    fieldname: 'Gender',
                    fieldvalue: widget.alumni.gender,
                  )
                ],
              ),
            ),
            RecordViewSlideFadeTransition(
              slideanimation: _slideanimation,
              opacityanimation: _opacityanimation,
              child: FieldCategory(
                categoryicon: Icons.calendar_today,
                widgets: <Widget>[
                  RecordData(
                    fieldname: 'Date of Birth',
                    fieldvalue: widget.alumni.dob,
                  ),
                  RecordData(
                    fieldname: 'Session From',
                    fieldvalue: widget.alumni.sesfrom,
                  ),
                  RecordData(
                    fieldname: 'Session To',
                    fieldvalue: widget.alumni.sesto,
                  ),
                ],
              ),
            ),
            RecordViewSlideFadeTransition(
              slideanimation: _slideanimation,
              opacityanimation: _opacityanimation,
              child: FieldCategory(
                categoryicon: Icons.contact_mail,
                widgets: <Widget>[
                  RecordData(
                    fieldname: 'Phone Number',
                    fieldvalue: widget.alumni.mobile,
                  ),
                  RecordData(
                    fieldname: 'Email',
                    fieldvalue: widget.alumni.email,
                  )
                ],
              ),
            ),
            RecordViewSlideFadeTransition(
              opacityanimation: _opacityanimation,
              slideanimation: _slideanimation,
              child: FieldCategory(
                categoryicon: Icons.work,
                widgets: <Widget>[
                  RecordData(
                    fieldname: 'Current Company',
                    fieldvalue: widget.alumni.currcomp,
                  ),
                  RecordData(
                    fieldname: 'Branch',
                    fieldvalue: widget.alumni.branch,
                  ),
                  RecordData(
                    fieldname: 'Designation',
                    fieldvalue: widget.alumni.desg,
                  ),
                ],
              ),
            ),
            RecordViewSlideFadeTransition(
              opacityanimation: _opacityanimation,
              slideanimation: _slideanimation,
              child: FieldCategory(
                categoryicon: Icons.location_on,
                widgets: <Widget>[
                  RecordData(
                    fieldname: 'Current Address',
                    fieldvalue: widget.alumni.currcity,
                  ),
                  RecordData(
                    fieldname: 'Current City',
                    fieldvalue: widget.alumni.currcity,
                  ),
                  RecordData(
                    fieldname: 'Correspondance Address',
                    fieldvalue: widget.alumni.corradd,
                  ),
                  RecordData(
                    fieldname: 'Office Address',
                    fieldvalue: widget.alumni.offadd,
                  )
                ],
              ),
            )
          ])),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
