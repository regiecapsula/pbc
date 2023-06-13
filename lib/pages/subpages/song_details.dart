import 'package:flutter/material.dart';

class SongDetailsScreen extends StatelessWidget {
  final int songNumber;
  final String songTitle;
  final String? refrain;
  final String? refrain2;
  final List<String> verses;

  SongDetailsScreen({
    required this.songNumber,
    required this.songTitle,
    this.refrain,
    this.refrain2,
    required this.verses,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Song Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  '$songNumber',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Text(
                  '$songTitle\n',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              if (refrain != null) ...[
                Text(
                  'Refrain:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  refrain!,
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 8),
              ],
              if (refrain2 != null) ...[
                Text(
                  'Refrain 2:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  refrain2!,
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 8),
              ],
              for (int i = 0; i < verses.length; i++) ...[
                if (verses[i].isNotEmpty)
                  Text(
                    'Verse ${i + 1}:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                Text(
                  verses[i],
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
