import 'package:flutter/material.dart';
import 'package:marvel_flutter/blocs/main_screen_bloc.dart';
import 'package:marvel_flutter/models/original/Movie.dart';
import 'package:marvel_flutter/screens/TodayMarvelCharacterScreen.dart';
import 'package:marvel_flutter/screens/common/CommonDrawer.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


final baseUrl = "https://www.marvel.com/movies";
final movieList = [
  Movie(1, 1, "Iron Man", "May 2, 2008", baseUrl + "/iron-man"),
  Movie(2, 1, "The Incredible Hulk", "June 13, 2010", baseUrl + "/the-incredible-hulk"),
  Movie(3, 1, "Iron Man 2", "May 7, 2010", baseUrl + "/iron-man-2"),
  Movie(4, 1, "Thor", "May 6, 2011", baseUrl + "/thor"),
  Movie(5, 1, "Captain America: The First Avenger", "July 22, 2011", baseUrl + "/captain-america-the-first-avenger"),
  Movie(6, 1, "Marvel's The Avengers", "May 4, 2012", baseUrl + "/the-avengers"),
  Movie(1, 2, "Iron Man 3", "May 3, 2013", baseUrl + "/iron-man-3"),
  Movie(2, 2, "Thor: The Dark World", "November 8, 2013", baseUrl + "/thor-the-dark-world"),
  Movie(3, 2, "Captain America: The Winter Soldier", "April 4, 2014", baseUrl + "/captain-america-the-winter-soldier"),
  Movie(4, 2, "Guardians of the Galaxy", "August 1, 2014", baseUrl + "/guardians-of-the-galaxy"),
  Movie(5, 2, "Avengers: Age of Ultron", "May 1, 2015", baseUrl + "/avengers-age-of-ultron"),
  Movie(6, 2, "Ant-Man", "July 17, 2015", baseUrl + "/ant-man"),
  Movie(1, 3, "Captain America: Civil War", "May 6, 2016", baseUrl + "/captain-america-civil-war"),
  Movie(2, 3, "Doctor Strange", "November 4, 2016", baseUrl + "/doctor-strange"),
  Movie(3, 3, "Guardians of the Galaxy Vol. 2", "May 5, 2017", baseUrl + "/guardians-of-the-galaxy-vol-2"),
  Movie(4, 3, "Spider-Man: Homecoming", "July 7, 2017", baseUrl + "/spider-man-homecoming"),
  Movie(5, 3, "Thor: Ragnarok", "November 3, 2017", baseUrl + "/thor-ragnarok"),
  Movie(6, 3, "Black Panther", "February 16, 2018", baseUrl + "/black-panther"),
  Movie(7, 3, "Avengers: Infinity War", "April 27, 2018", baseUrl + "/avengers-infinity-war"),
  Movie(8, 3, "Ant-Man and the Wasp", "July 6, 2018", baseUrl + "/ant-man-and-the-wasp"),
  Movie(9, 3, "Captain Marvel", "March 8, 2019", baseUrl + "/captain-marvel"),
  Movie(10, 3, "Avengers: Endgame", "April 26, 2019", baseUrl + "/avengers-endgame"),
  Movie(11, 3, "Spider-Man: Far From Home", "July 2, 2019", baseUrl + "/spider-man-far-from-home"),
  Movie(1, 4, "Black Widow", "May 1, 2020", baseUrl + "/black-widow"),
  Movie(2, 4, "The Eternals", "November 6, 2020", baseUrl + "/the-eternals"),
  Movie(3, 4, "Shang-chi and the legend of ten rings", "XXXX", baseUrl + "/shang-chi-and-the-legend-of-the-ten-rings"),
  Movie(4, 4, "Doctor strange in the multiverse of madness", "XXXX", baseUrl + "/doctor-strange-in-the-multiverse-of-madness"),
  Movie(5, 4, "Thor: love and thunder", "XXXX", baseUrl + "/thor-love-and-thunder"),
];

class MainScreen extends StatelessWidget {

  void _launchUrl(final String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  List<Widget> _buildMovieList(List<Movie> dataList, int phase) {
    List<Widget> widgetList = [];
    dataList.forEach((movie) {
      if (movie.phase == phase) {
        widgetList.add(
          ListTile(
            leading: Text(movie.id.toString()),
            title: Text(movie.title),
            subtitle: Text(movie.date),
            trailing: IconButton(
              icon: Icon(Icons.link),
              tooltip: 'Link',
              onPressed: () => _launchUrl(movie.url),
            )
          )
        );
      }
    });
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<MainScreenBloc>(context);

    return StreamBuilder(
        initialData: 0,
        stream: bloc.getSelected,
        builder: (context, snapshot)
    {
      return Scaffold(
          appBar: AppBar(
            title: Text("Marvel Application"),
          ),
          drawer: CommonDrawer(),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.looks_one), title: Text("Phase One")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.looks_two), title: Text("Phase Two")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.looks_3), title: Text("Phase Three")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.looks_4), title: Text("Phase Four")),
            ],
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.blue,
            currentIndex: snapshot.data,
            onTap: (int item) {
              bloc.select.add(item);
            },
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Today\'s Marvel Character',
            child: Icon(Icons.star),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TodayMarvelCharacterScreen()),
              );
            },
          ),
          body: Center(
            child: ListView(
              children: _buildMovieList(movieList, snapshot.data+1)
            )
          )
        );
      }
    );
  }
}