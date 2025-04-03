import 'package:flutter/material.dart';
import '../models/show_model.dart';
import '../screens/update_show_screen.dart';

class ShowList extends StatelessWidget {
  final List<Show> shows;
  final Function(Show) onUpdate;

  const ShowList({super.key, required this.shows, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shows.length,
      itemBuilder: (context, index) {
        Show show = shows[index];
        return ListTile(
          title: Text(show.title),
          subtitle: Text(show.description),
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final updatedShow = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateShowScreen(show: show),
                ),
              );

              if (updatedShow != null) {
                onUpdate(updatedShow);
              }
            },
          ),
        );
      },
    );
  }
}
