import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import  'package:pbc/pages/subpages/song_details.dart';

class Songs extends StatelessWidget {
  // db reference
  final databaseRef = FirebaseDatabase.instance.ref('songs');

  // function to fetch
  Future<DataSnapshot> fetchData() async {
    DatabaseEvent event = await databaseRef.child('english2').once();
    DataSnapshot snapshot = event.snapshot;
    return snapshot;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DataSnapshot>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          // Extract data from the snapshot and perform type cast
          dynamic data = snapshot.data!.value;

          if (data is List<dynamic>) {
            // Return a GridView.builder with dynamic cross-axis count
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double screenWidth = constraints.maxWidth;
                int crossAxisCount = screenWidth < 600 ? 5 : 10;

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    var item = data[index];
                    if (item is Map<dynamic, dynamic> && item.containsKey('title')) {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to the new activity
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SongDetailsScreen(
                                songNumber: item['number'],
                                songTitle: item['title'],
                                refrain: item['refrain'],
                                refrain2: item['refrain2'],
                                verses: List<String>.generate(
                                  7,
                                      (index) => item['verse${index + 1}'] ?? '',
                                ),
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(item['number'].toString()),
                            ],
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                  itemCount: data.length,
                );
              },
            );
          }
        }

        return Container();
      },
    );
  }
}
