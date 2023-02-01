import 'package:flutter/material.dart';
import 'package:pbc/pages/finances.dart';
import 'package:pbc/pages/home.dart';
import 'package:pbc/pages/property.dart';
import 'package:pbc/pages/songs.dart';

void main() {
  runApp(PBC());
}

class PBC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'PBC', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Songs(),
    Finances(),
    Property(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.music_note), label: "Songs"),
            BottomNavigationBarItem(
                icon: Icon(Icons.attach_money), label: "Finances"),
            BottomNavigationBarItem(
                icon: Icon(Icons.edit_note_rounded), label: "Property")
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.lightBlue,
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped),
    );
  }
}
