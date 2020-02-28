import 'package:flutter/material.dart';
import 'package:marvel_flutter/screens/ChractersScreen.dart';
import 'package:marvel_flutter/screens/ComicsScreen.dart';
import 'package:marvel_flutter/screens/CreatorsScreen.dart';
import 'package:marvel_flutter/screens/EventsScreen.dart';
import 'package:marvel_flutter/screens/SeriesScreen.dart';
import 'package:marvel_flutter/screens/StoriesScreen.dart';
import 'package:marvel_flutter/screens/TodayMarvelCharacterScreen.dart';

class _Movie {
  final int id;
  final String title;
  final String date;

  _Movie(this.id, this.title, this.date);
}

final movieList = [
  _Movie(1, "Iron Man", "May 2, 2008"),
];

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget _buildDrawer() {
      return(
        Drawer(
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
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Marvel Application"),
      ),
      drawer: _buildDrawer(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Today\'s Marvel Character',
        child: Icon(Icons.star),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodayMarvelCharacterScreen()),
          );
        },
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Text(movieList[0].id.toString()),
              title: Text(movieList[0].title),
              subtitle: Text(movieList[0].date),
            ),
            ListTile(
              leading: Text("2"),
              title: Text("The Incredible Hulk"),
              subtitle: Text("June 13, 2008"),
            ),
            ListTile(
              leading: Text("3"),
              title: Text("Iron Man 2"),
              subtitle: Text("May 7, 2010"),
            ),
            ListTile(
              leading: Text("4"),
              title: Text("Thor"),
              subtitle: Text("May 6, 2011"),
            ),
            ListTile(
              leading: Text("5"),
              title: Text("Captain America: The First Avenger"),
              subtitle: Text("July 22, 2011"),
            ),
            ListTile(
              leading: Text("6"),
              title: Text("Marvel's The Avengers"),
              subtitle: Text("May 4, 2012"),
            ),
          ],
        ),
      )
    );
  }

}