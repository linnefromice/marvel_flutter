import 'package:flutter/material.dart';
import 'package:marvel_flutter/models/CharactersResult.dart';
import 'package:marvel_flutter/models/EventsResult.dart';
import 'package:marvel_flutter/models/SeriesResult.dart';
import 'package:marvel_flutter/models/domain/Character.dart';
import 'package:marvel_flutter/models/domain/Event.dart';
import 'package:marvel_flutter/models/domain/Series.dart';
import 'package:marvel_flutter/services/MarvelApiService.dart';

class EventsScreen extends StatelessWidget {

  /*
  Widget _buildCharacterList(final SeriesResult result) {
    final List<Series> list = result.data.results;

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final Series item = list[index];
        if (item.description == null) {
          return ListTile(
            title: Text(item.title),
          );
        } else {
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.description),
          );
        }
      },
    );
  }
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marvel Events"),
      ),
      body: Center(
        child: FutureBuilder<EventsResult>(
          future: MarvelApiService.fetchEvents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final EventsResult result = snapshot.data;
              return Text(result.data.results[0].toJson().toString());
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'refresh',
        child: Icon(Icons.refresh),
        onPressed: () {
          MarvelApiService.fetchEvents();
        },
      ),
    );
  }
}
