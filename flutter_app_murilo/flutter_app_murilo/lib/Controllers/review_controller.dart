import 'package:flutter_app_murilo/NetWorks/network.dart';
import 'dart:convert';

class Review {
  late int review_id;
  late String nick_name;
  late String anime_title;
  late String review_text;
  late int likes;
  late int dislikes;
  late double grade;

  Review(
      {required this.review_id,
      required this.nick_name,
      required this.anime_title,
      required this.review_text,
      required this.likes,
      required this.dislikes,
      required this.grade});

  Review.fromJson(Map<String, dynamic> json) {
    review_id = json['reviewId'];
    nick_name = json['nickName'];
    anime_title = json['anime_title'];
    review_text = json['reviewText'];
    likes = json['likes'];
    dislikes = json['dislikes'];
    grade = json['grade'];
  }

  dynamic toJson() {
    var json = jsonEncode(<String, dynamic>{
      'review_id': review_id,
      'nick_name': nick_name,
      'anime_title': anime_title,
      'review_text': review_text,
      'likes': likes,
      'dislikes': dislikes,
      'grade': grade
    });
    return json;
  }

  Map<String, dynamic> _toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review_id'] = this.review_id;
    data['nick_name'] = this.nick_name;
    data['anime_title'] = this.anime_title;
    data['review_text'] = this.review_text;
    data['likes'] = this.likes;
    data['dislikes'] = this.dislikes;
    data['grade'] = this.grade;
    return data;
  }
}
