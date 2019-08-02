import 'package:flutter/material.dart';

class RecordFieldData extends StatelessWidget {
  final String text;
  RecordFieldData(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
