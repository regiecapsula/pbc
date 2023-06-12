import 'package:flutter/material.dart';

class SongDetailsScreen extends StatelessWidget {
  final int songNumber;
  final String songTitle;
  final String verse1;
  final String verse2;
  final String verse3;

  SongDetailsScreen({
    required this.songNumber,
    required this.songTitle,
    required this.verse1,
    required this.verse2,
    required this.verse3,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Song Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Song Number: $songNumber'.toString(),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Song Title: $songTitle',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Verse 1: $verse1',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Verse 2: $verse2',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Verse 3: $verse3',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
