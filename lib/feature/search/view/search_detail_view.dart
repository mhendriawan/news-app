import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../network/network.dart';

class SearchDetailView extends StatelessWidget {
  const SearchDetailView({
    Key? key,
    required this.searchData,
  }) : super(key: key);
  
  final SearchData searchData;

  @override
  Widget build(BuildContext context) {
    return CardDetailNews(
      image: searchData.urlToImage ?? "",
      title: searchData.title ?? "",
      sourceLink: searchData.url ?? "",
      author: searchData.author ?? "",
      date: formattedDate(searchData.publishedAt ?? DateTime.now()),
      description: searchData.description ?? "",
    );
  }
}
