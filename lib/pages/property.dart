import 'package:flutter/material.dart';

class Property extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Home'),
    ),
    body: Center(child: Text('Property', style: TextStyle(fontSize: 60))),
  );
}
