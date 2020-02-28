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
  _Movie(2, "The Incredible Hulk", "June 13, 2010"),
  _Movie(3, "Iron Man 2", "May 7, 2010"),
  _Movie(4, "Thor", "May 6, 2011"),
  _Movie(5, "Captain America: The First Avenger", "July 22, 2011"),
  _Movie(6, "Marvel's The Avengers", "May 4, 2012"),
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
              leading: Text(movieList[1].id.toString()),
              title: Text(movieList[1].title),
              subtitle: Text(movieList[1].date),
            ),
            ListTile(
              leading: Text(movieList[2].id.toString()),
              title: Text(movieList[2].title),
              subtitle: Text(movieList[2].date),
            ),
            ListTile(
              leading: Text(movieList[3].id.toString()),
              title: Text(movieList[3].title),
              subtitle: Text(movieList[3].date),
            ),
            ListTile(
              leading: Text(movieList[4].id.toString()),
              title: Text(movieList[4].title),
              subtitle: Text(movieList[4].date),
            ),
            ListTile(
              leading: Text(movieList[5].id.toString()),
              title: Text(movieList[5].title),
              subtitle: Text(movieList[5].date),
            ),
          ],
        ),
      )
    );
  }

}