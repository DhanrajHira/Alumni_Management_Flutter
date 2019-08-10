import 'package:flutter/material.dart';

class FieldCategory extends StatelessWidget {
  final List<Widget> widgets;
  final IconData categoryicon;

  FieldCategory({this.widgets, this.categoryicon});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: theme.dividerColor))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            width: 72.0,
            child: Icon(categoryicon),
          ),
          Expanded(
            child: Column(
              children: widgets,
            ),
          )
        ],
      ),
    );
  }
}

class RecordData extends StatelessWidget {
  String fieldvalue;
  final String fieldname;
  final IconData icon;

  RecordData({this.fieldname, this.fieldvalue, this.icon});

  void checkstringlength() {
    if (fieldvalue.length >= 18) {
      List lines = fieldvalue.split(' ');
      fieldvalue = '''lines''';
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Widget> columnlist = [
      Text(
        fieldvalue,
        style: theme.textTheme.title,
      ),
      (Text(fieldname, style: theme.textTheme.caption))
    ];

    List<Widget> rowlist = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columnlist,
      )
    ];
    if (icon != null) {
      rowlist.add(
        SizedBox(
          width: 72.0,
          child: Icon(icon),
        ),
      );
    }

    return MergeSemantics(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: rowlist),
      ),
    );
  }
}
