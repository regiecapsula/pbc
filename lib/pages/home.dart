import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '../items/item_announcement.dart';

class Home extends StatelessWidget {
  final List listAnnouncements = ['post 1', 'post 2', 'post 3', 'post 4'];
  final DatabaseReference dbRef = FirebaseDatabase.instance.ref("events/upcoming/2022");

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: (context, snapshot, animation, index){
                  return ListTile(
                    title: Text(snapshot.child('title').value.toString()),
                    subtitle: Text(snapshot.child('details').value.toString()),
                  );
                }
            ),
          )
        ],
      ));

}
