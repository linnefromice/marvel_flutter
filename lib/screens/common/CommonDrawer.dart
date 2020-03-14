import 'package:flutter/material.dart';
import 'package:marvel_flutter/screens/ChractersScreen.dart';
import 'package:marvel_flutter/screens/ComicsScreen.dart';
import 'package:marvel_flutter/screens/CreatorsScreen.dart';
import 'package:marvel_flutter/screens/EventsScreen.dart';
import 'package:marvel_flutter/screens/SeriesScreen.dart';
import 'package:marvel_flutter/screens/StoriesScreen.dart';

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Characters'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CharactersScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Series'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SeriesScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Stories'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StoriesScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Comics'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ComicsScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Events'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EventsScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Creators'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreatorsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}