import 'package:flutter/material.dart';

class InformationSegment extends StatelessWidget {
  final String info;
  InformationSegment({this.info});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.red,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              info,
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
