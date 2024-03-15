import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../search/search.dart';
import '../headline.dart';

class HeadlinesView extends StatelessWidget {
  const HeadlinesView({
    Key? key,
    required this.headlines,
  }) : super(key: key);

  final List<HeadlineData> headlines;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalettes.darkPrimary,
      appBar: AppBar(
        backgroundColor: ColorPalettes.darkPrimary,
        title: const Text(
          'Headline News',
          style: CustomTextStyle.headerWhiteBold18,
        ),
        actions: [
          IconButton(
            onPressed: () => onTapSearchIcon(context),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: headlines.length,
          itemBuilder: (context, index) {
            HeadlineData headlineData = headlines[index];
            return GestureDetector(
              onTap: () => onTapCard(context, headlineData),
              child: CardNews(
                image: headlineData.urlToImage ?? "",
                title: headlineData.title ?? "",
                author: headlineData.author ?? "",
                date: formattedDate(headlineData.publishedAt),
              ),
            );
          },
        ),
      ),
    );
  }

  onTapCard(BuildContext context, HeadlineData headlineData) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: ColorPalettes.transparent,
      builder: (context) => HeadlineDetailView(headlineData: headlineData),
    );
  }

  onTapSearchIcon(BuildContext context) {
    Navigation.intent(context, SearchView.routeName);
  }
}
