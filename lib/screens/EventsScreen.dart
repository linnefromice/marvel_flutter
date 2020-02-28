import 'package:flutter/material.dart';
import 'package:marvel_flutter/models/EventsResult.dart';
import 'package:marvel_flutter/models/domain/Event.dart';
import 'package:marvel_flutter/services/MarvelApiService.dart';

class EventsScreen extends StatelessWidget {

  Widget _buildEventList(final EventsResult result) {
    final List<Event> list = result.data.results;

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final Event item = list[index];
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
        title: Text("Marvel Events"),
      ),
      body: Center(
        child: FutureBuilder<EventsResult>(
          future: MarvelApiService.fetchEvents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildEventList(snapshot.data);
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
