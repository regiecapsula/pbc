import 'package:flutter/material.dart';

class Announcement extends StatelessWidget {
  // Fields
  final String announcement;

  // Constructor
  Announcement({required this.announcement});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 400,
        color: Colors.deepPurple[200],
        child: Text(
          announcement,
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
