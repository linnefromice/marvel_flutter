import 'package:flutter/material.dart';
import 'package:marvel_flutter/blocs/main_screen_bloc.dart';
import 'package:marvel_flutter/screens/ChractersScreen.dart';
import 'package:marvel_flutter/screens/ComicsScreen.dart';
import 'package:marvel_flutter/screens/CreatorsScreen.dart';
import 'package:marvel_flutter/screens/EventsScreen.dart';
import 'package:marvel_flutter/screens/SeriesScreen.dart';
import 'package:marvel_flutter/screens/StoriesScreen.dart';
import 'package:marvel_flutter/screens/TodayMarvelCharacterScreen.dart';
import 'package:provider/provider.dart';

class _Movie {
  final int id;
  final int phase;
  final String title;
  final String date;

  _Movie(this.id, this.phase, this.title, this.date);
}

final movieList = [
  _Movie(1, 1, "Iron Man", "May 2, 2008"),
  _Movie(2, 1, "The Incredible Hulk", "June 13, 2010"),
  _Movie(3, 1, "Iron Man 2", "May 7, 2010"),
  _Movie(4, 1, "Thor", "May 6, 2011"),
  _Movie(5, 1, "Captain America: The First Avenger", "July 22, 2011"),
  _Movie(6, 1, "Marvel's The Avengers", "May 4, 2012"),
  _Movie(1, 2, "Iron Man 3", "May 3, 2013"),
  _Movie(2, 2, "Thor: The Dark World", "November 8, 2013"),
  _Movie(3, 2, "Captain America: The Winter Soldier", "April 4, 2014"),
  _Movie(4, 2, "Guardians of the Galaxy", "August 1, 2014"),
  _Movie(5, 2, "Avengers: Age of Ultron", "May 1, 2015"),
  _Movie(6, 2, "Ant-Man", "July 17, 2015"),
  _Movie(1, 3, "Captain America: Civil War", "May 6, 2016"),
  _Movie(2, 3, "Doctor Strange", "November 4, 2016"),
  _Movie(3, 3, "Guardians of the Galaxy Vol. 2", "May 5, 2017"),
  _Movie(4, 3, "Spider-Man: Homecoming", "July 7, 2017"),
  _Movie(5, 3, "Thor: Ragnarok", "November 3, 2017"),
  _Movie(6, 3, "Black Panther", "February 16, 2018"),
  _Movie(7, 3, "Avengers: Infinity War", "April 27, 2018"),
  _Movie(8, 3, "Ant-Man and the Wasp", "July 6, 2018"),
  _Movie(9, 3, "Captain Marvel", "March 8, 2019"),
  _Movie(10, 3, "Avengers: Endgame", "April 26, 2019"),
  _Movie(11, 3, "Spider-Man: Far From Home", "July 2, 2019"),
  _Movie(1, 4, "Black Widow", "May 1, 2020"),
  _Movie(2, 4, "The Eternals", "November 6, 2020"),
];

class MainScreen extends StatelessWidget {
  int _index = 0;

  List<Widget> _buildMovieList(List<_Movie> dataList) {
    List<Widget> widgetList = [];
    dataList.forEach((movie) {
      widgetList.add(
        ListTile(
          leading: Text(movie.id.toString()),
          title: Text(movie.title),
          subtitle: Text(movie.date),
        )
      );
    });
    return widgetList;
  }

  Widget _buildDrawer(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<MainScreenBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Marvel Application"),
      ),
      drawer: _buildDrawer(context),
      bottomNavigationBar: StreamBuilder(
        initialData: 0,
        stream: bloc.getSelected,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.looks_one), title: Text("Phase One")),
              BottomNavigationBarItem(icon: Icon(Icons.looks_two), title: Text("Phase Two")),
              BottomNavigationBarItem(icon: Icon(Icons.looks_3), title: Text("Phase Three")),
              BottomNavigationBarItem(icon: Icon(Icons.looks_4), title: Text("Phase Four")),
            ],
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.blue,
            currentIndex: snapshot.data,
            onTap: (int item){
              bloc.select.add(item);
            },
          );
        },
      ),
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
          children: _buildMovieList(movieList)
        )
      )
    );
  }

}