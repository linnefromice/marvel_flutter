import 'package:flutter/material.dart';
import 'package:marvel_flutter/models/common/Image.dart' as CommonImage;
import 'package:marvel_flutter/models/domain/Character.dart';
import 'package:marvel_flutter/services/MarvelApiService.dart';

class TodayMarvelCharacterScreen extends StatelessWidget {

  Widget _buildProfileImage(final CommonImage.Image thumbnail) {
    final url = thumbnail.path + '/portrait_medium.' + thumbnail.extension;
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(120.0),
          border: Border.all(
            color: Colors.white,
            width: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildResult(final Character data) {
    return (
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildProfileImage(data.thumbnail),
              Center(
                child: Text(
                  data.id.toString(),
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 20
                  ),
                ),
              ),
              Center(
                child: Text(
                  data.name,
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 25
                  ),
                ),
              ),
              Center(
                child: Text(data.description),
              ),
            ],
          ),
        ),
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