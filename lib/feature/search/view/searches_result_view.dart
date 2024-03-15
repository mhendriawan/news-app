import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../search.dart';

class SearchesResultView extends StatelessWidget {
  const SearchesResultView({
    Key? key,
    required this.searches,
  }) : super(key: key);

  final List<SearchData> searches;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalettes.darkPrimary,
      appBar: AppBar(
        backgroundColor: ColorPalettes.darkPrimary,
        title: const Text(
          'Search News',
          style: CustomTextStyle.headerWhiteBold18,
        ),
        actions: [
          IconButton(
            onPressed: () => onTapSearch(context),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: searches.length,
          itemBuilder: (context, index) {
            SearchData searchData = searches[index];
            return GestureDetector(
              onTap: () => onTapCard(context, searchData),
              child: CardNews(
                image: searchData.urlToImage ?? "",
                title: searchData.title ?? "",
                author: searchData.author ?? "",
                date: formattedDate(searchData.publishedAt ?? DateTime.now()),
              ),
            );
          },
        ),
      ),
    );
  }

  onTapCard(BuildContext context, SearchData searchData) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: ColorPalettes.transparent,
      builder: (context) => SearchDetailView(searchData: searchData),
    );
  }

  onTapSearch(BuildContext context) {
    Navigation.intentWithoutBack(context, SearchView.routeName);
  }
}
