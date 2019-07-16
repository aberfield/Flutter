import 'package:f/main_random.dart';
import 'package:flutter/material.dart';

class PaddingTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Hello world"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text("I an Jack"),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, .0, 20, 20.0),
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}