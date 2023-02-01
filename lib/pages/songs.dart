import 'package:flutter/material.dart';

class Songs extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Songs'),
    ),
    body: Center(child: Text('Songs', style: TextStyle(fontSize: 60))),
  );
}
