import 'dart:convert';

import 'package:equatable/equatable.dart';

SearchResponseModel searchResponseModelFromJson(String str) => SearchResponseModel.fromJson(json.decode(str));

String searchResponseModelToJson(SearchResponseModel data) => json.encode(data.toJson());

class SearchResponseModel extends Equatable {
  final String status;
  final String? message;
  final List<SearchData> searches;

  const SearchResponseModel({
    required this.status,
    this.message,
    required this.searches,
  });

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) => SearchResponseModel(
    status: json["status"],
    searches: List<SearchData>.from(json["articles"].map((x) => SearchData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "articles": List<dynamic>.from(searches.map((x) => x.toJson())),
  };

  @override
  List<Object?> get props => [
    status,
    message,
    searches,
  ];
}

class SearchData {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  SearchData({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
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
    "publishedAt": publishedAt!.toIso8601String(),
    "content": content,
  };
}