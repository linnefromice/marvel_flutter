import 'package:flutter/material.dart';
import 'package:marvel_flutter/models/StoriesResult.dart';
import 'package:marvel_flutter/services/MarvelApiService.dart';

class StoriesScreen extends StatelessWidget {

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
        title: Text("Marvel Stories"),
      ),
      body: Center(
        child: FutureBuilder<StoriesResult>(
          future: MarvelApiService.fetchStories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              StoriesResult result = snapshot.data;
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
          MarvelApiService.fetchStories();
        },
      ),
    );
  }
}
