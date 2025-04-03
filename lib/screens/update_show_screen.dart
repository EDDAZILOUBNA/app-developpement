import 'package:flutter/material.dart';
import '../models/show_model.dart';
import '../services/api_service.dart';

class UpdateShowScreen extends StatefulWidget {
  final Show show;
  
  const UpdateShowScreen({super.key, required this.show});

  @override
  _UpdateShowScreenState createState() => _UpdateShowScreenState();
}

class _UpdateShowScreenState extends State<UpdateShowScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController categoryController;
  late TextEditingController imageController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.show.title);
    descriptionController = TextEditingController(text: widget.show.description);
    categoryController = TextEditingController(text: widget.show.category);
    imageController = TextEditingController(text: widget.show.image);
  }

  void updateShow() async {
    if (_formKey.currentState!.validate()) {
      Show updatedShow = Show(
        id: widget.show.id,
        title: titleController.text,
        description: descriptionController.text,
        category: categoryController.text,
        image: imageController.text,
      );

      await ApiService.updateShow(updatedShow);
      Navigator.pop(context, updatedShow);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Modifier le Show")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Titre"),
                validator: (value) => value!.isEmpty ? "Champ requis" : null,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: "Description"),
                validator: (value) => value!.isEmpty ? "Champ requis" : null,
              ),
              TextFormField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: "Catégorie"),
              ),
              TextFormField(
                controller: imageController,
                decoration: const InputDecoration(labelText: "URL de l'image"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: updateShow,
                child: const Text("Mettre à jour"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
