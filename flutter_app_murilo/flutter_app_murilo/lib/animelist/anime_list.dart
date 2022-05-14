import 'dart:convert';

class Anime {
  late String title;
  late String description;
  late int score;
  late String cover_photo;
  late String genre;
  late List<String> review;

  Anime(
      {required this.title,
      required this.description,
      required this.score,
      required this.cover_photo,
      required this.genre,
      required this.review});

  dynamic from_json(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return Anime(
      title: map['title'],
      description: map['description'],
      score: map['score'],
      cover_photo: map['cover_photo'],
      genre: map['genre'],
      review: map['review'],
    );
  }

  dynamic to_json() {
    var json = jsonEncode(<String, dynamic>{
      'title': title,
      'description': description,
      'score': score,
      'cover_photo': cover_photo,
      'genre': genre,
      'review': review,
    });
    return json;
  }

  Map<String, dynamic> _toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = this.title;
    data['description'] = this.description;
    data['score'] = this.score;
    data['coverPhoto'] = this.cover_photo;
    data['genre'] = this.genre;
    return data;
  }
}
