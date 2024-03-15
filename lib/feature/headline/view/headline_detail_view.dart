import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../headline.dart';

class HeadlineDetailView extends StatelessWidget {
  const HeadlineDetailView({
    Key? key,
    required this.headlineData,
  }) : super(key: key);

  final HeadlineData headlineData;

  @override
  Widget build(BuildContext context) {
    return CardDetailNews(
      image: headlineData.urlToImage ?? "",
      title: headlineData.title ?? "",
      sourceLink: headlineData.url ?? "",
      author: headlineData.author ?? "",
      date: formattedDate(headlineData.publishedAt),
      description: headlineData.description ?? "",
    );
  }
}
