import 'package:drawer/screens/screen1.dart';
import 'package:drawer/screens/screen2.dart';
import 'package:drawer/screens/screen3.dart';
import 'package:drawer/screens/screen4.dart';
import 'package:drawer/screens/screen5.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Navigation Demo',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Menu 1 ", Icons.home),
    new DrawerItem("Menu 2", Icons.article),
    new DrawerItem("Menu 3", Icons.dashboard),
    new DrawerItem("Menu 4", Icons.dashboard),
    new DrawerItem("Menu 5", Icons.dashboard)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  String currentProfilePic = "https://dummyimage.com/200/ffffff/000000";

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Screen1();
      case 1:
        return new Screen2();
      case 2:
        return new Screen3();
      case 3:
        return new Screen4();
      case 4:
        return new Screen5();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return WillPopScope(
      onWillPop: () {
        if (_selectedDrawerIndex != 0) {
          setState(() {
            _selectedDrawerIndex = 0;
          });
          _getDrawerItemWidget(_selectedDrawerIndex);
        } else {
          Navigator.pop(context, true);
        }
        return Future.value(false);
      },
      child: Scaffold(
        appBar: new AppBar(
          title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
        ),
        drawer: new Drawer(
          child: new Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: new Text("almirawulank@gmail.com"),
                accountName: new Text("Almira"),
                currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(currentProfilePic),
                  ),
                  onTap: () => print("This is your current account."),
                ),
              ),
              Column(children: drawerOptions)
            ],
          ),
        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
      ),
    );
  }
}
