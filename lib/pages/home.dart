import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../items/item_announcement.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

class Home extends StatelessWidget {
  final List listAnnouncements = ['post 1', 'post 2', 'post 3', 'post 4'];
  String data ="";

  getString() async {
    FirebaseDatabase.instance
        .ref("prayer_items/0/item")
        .onValue
        .listen((DatabaseEvent event) {
      data = event.snapshot.value.toString();
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: listAnnouncements.length,
        itemBuilder: (context, index) {
          getString();
          return Announcement(
              announcement: listAnnouncements[index]);
        },
      ));



}
