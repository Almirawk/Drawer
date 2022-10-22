import 'package:flutter/material.dart';

class Screen5 extends StatelessWidget {
  const Screen5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyStatefullWidget();
  }
}

class MyStatefullWidget extends StatefulWidget {
  const MyStatefullWidget({super.key});

  @override
  State<MyStatefullWidget> createState() => _MyStatefullWidgetState();
}

class _MyStatefullWidgetState extends State<MyStatefullWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOpions = <Widget>[
    Text(
      'Index 0: satu',
      style: optionStyle,
    ),
    Text(
      'Index 1: dua',
      style: optionStyle,
    ),
    Text(
      'Index 2: tiga',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom NavigatorBar'),
      ),
      body: Center(
        child: _widgetOpions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'satu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'dua',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'tiga',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
