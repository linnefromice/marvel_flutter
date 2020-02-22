import 'package:flutter/material.dart';
import 'package:marvel_flutter/models/CharactersResult.dart';
import 'package:marvel_flutter/models/ComicsResult.dart';
import 'package:marvel_flutter/models/domain/Character.dart';
import 'package:marvel_flutter/models/domain/Comic.dart';
import 'package:marvel_flutter/services/MarvelApiService.dart';

class ComicsScreen extends StatelessWidget {

  Widget _buildComicList(final ComicsResult result) {
    final List<Comic> list = result.data.results;

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final Comic item = list[index];
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
        title: Text("Marvel Characters"),
      ),
      body: Center(
        child: FutureBuilder<ComicsResult>(
          future: MarvelApiService.fetchComics(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildComicList(snapshot.data);
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
          MarvelApiService.fetchComics();
        },
      ),
    );
  }
}
