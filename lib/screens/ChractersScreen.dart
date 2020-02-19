import 'package:flutter/material.dart';
import 'package:marvel_flutter/models/CharactersResult.dart';
import 'package:marvel_flutter/models/domain/Character.dart';
import 'package:marvel_flutter/services/MarvelApiService.dart';

class CharactersScreen extends StatelessWidget {

  Widget _buildCharacterList(final CharactersResult result) {
    final List<Character> list = result.data.results;

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final Character item = list[index];
        return ListTile(
          title: Text(item.name),
          subtitle: Text(item.description),
        );
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
        child: FutureBuilder<CharactersResult>(
          future: MarvelApiService.fetchCharacters(),
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
