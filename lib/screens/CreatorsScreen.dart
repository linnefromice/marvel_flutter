import 'package:flutter/material.dart';
import 'package:marvel_flutter/models/CreatorsResult.dart';
import 'package:marvel_flutter/services/MarvelApiService.dart';

class CreatorsScreen extends StatelessWidget {

  /*
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
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marvel Creators"),
      ),
      body: Center(
        child: FutureBuilder<CreatorsResult>(
          future: MarvelApiService.fetchCreators(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final CreatorsResult result = snapshot.data;
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
          MarvelApiService.fetchCharacters();
        },
      ),
    );
  }
}
