import 'dart:convert';

class Show {
  final int id;
  final String title;
  final String description;
  final String category;
  final String image;

  Show({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
  });

  // Convertir un objet JSON en instance de Show
  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }

  // Convertir une instance de Show en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'image': image,
    };
  }

  // Méthode pour convertir une liste JSON en liste d'objets Show
  static List<Show> listFromJson(String jsonString) {
    Iterable list = jsonDecode(jsonString);
    return list.map((show) => Show.fromJson(show)).toList();
  }
}
