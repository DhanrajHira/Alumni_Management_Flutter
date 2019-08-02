import 'package:flutter/material.dart';

class RecordViewFieldName extends StatelessWidget {
  final String text;
  RecordViewFieldName(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
