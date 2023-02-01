import 'package:flutter/material.dart';

class Finances extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Finances'),
    ),
    body: Center(child: Text('Finances', style: TextStyle(fontSize: 60))),
  );
}
