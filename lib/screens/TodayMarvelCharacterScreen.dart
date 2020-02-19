import 'package:flutter/material.dart';
import 'package:marvel_flutter/models/domain/Character.dart';
import 'package:marvel_flutter/services/MarvelApiService.dart';

class TodayMarvelCharacterScreen extends StatelessWidget {
  Widget _buildResult(final Character data) {
    return (
      ListView(
        children: <Widget>[
          ListTile(
            title: Text(data.name),
            subtitle: Text(data.description),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: MarvelApiService.fetchRandomCharacter(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildResult(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}