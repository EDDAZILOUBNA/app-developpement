import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/show_model.dart';
import '../widgets/show_list.dart';
import 'update_show_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Show> shows = [];

  @override
  void initState() {
    super.initState();
    fetchShows();
  }

  void fetchShows() async {
    List<Show> data = await ApiService.getShows();
    setState(() {
      shows = data;
    });
  }

  void updateShow(Show updatedShow) {
    setState(() {
      int index = shows.indexWhere((s) => s.id == updatedShow.id);
      if (index != -1) {
        shows[index] = updatedShow;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liste des Shows")),
      body: ShowList(shows: shows, onUpdate: updateShow),
    );
  }
}
