import 'package:flutter/material.dart';

import '../items/item_announcement.dart';

class Home extends StatelessWidget {

  //
  final List listAnnouncements = ['post 1', 'post 2', 'post 3', 'post 4'];

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: listAnnouncements.length,
        itemBuilder: (context, index) {
          return Announcement(
            announcement: listAnnouncements[index],
          );
        },
      ));
}
