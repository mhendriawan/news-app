// To parse this JSON data, do
//
//     final headlineResponseModel = headlineResponseModelFromJson(jsonString);

import 'dart:convert';

HeadlineResponseModel headlineResponseModelFromJson(String str) => HeadlineResponseModel.fromJson(json.decode(str));

String headlineResponseModelToJson(HeadlineResponseModel data) => json.encode(data.toJson());

class HeadlineResponseModel {
  final String status;
  final String? message;
  final List<HeadlineData> headlines;

  HeadlineResponseModel({
    required this.status,
    this.message,
    required this.headlines,
  });

  factory HeadlineResponseModel.fromJson(Map<String, dynamic> json) => HeadlineResponseModel(
    status: json["status"],
    headlines: List<HeadlineData>.from(json["articles"].map((x) => HeadlineData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "articles": List<dynamic>.from(headlines.map((x) => x.toJson())),
  };
}

class HeadlineData {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String? content;

  HeadlineData({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory HeadlineData.fromJson(Map<String, dynamic> json) => HeadlineData(
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}