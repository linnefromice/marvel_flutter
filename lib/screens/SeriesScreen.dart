import 'package:flutter/material.dart';
import 'package:marvel_flutter/models/CharactersResult.dart';
import 'package:marvel_flutter/models/SeriesResult.dart';
import 'package:marvel_flutter/models/domain/Character.dart';
import 'package:marvel_flutter/models/domain/Series.dart';
import 'package:marvel_flutter/services/MarvelApiService.dart';

class SeriesScreen extends StatelessWidget {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marvel Series"),
      ),
      body: Center(
        child: FutureBuilder<SeriesResult>(
          future: MarvelApiService.fetchSeries(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildCharacterList(snapshot.data);
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
          MarvelApiService.fetchCharacters();
        },
      ),
    );
  }
}
