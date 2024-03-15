import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/shared.dart';
import '../search.dart';

class SearchView extends StatelessWidget {
  static const routeName = '/search-news';

  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController txtSearch = TextEditingController();
    return Scaffold(
      backgroundColor: ColorPalettes.darkPrimary,
      appBar: AppBar(
        backgroundColor: ColorPalettes.darkPrimary,
        elevation: 0,
        title: Container(
          decoration: CustomBoxDecoration.boxGrey350,
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search News',
              hintStyle: CustomTextStyle.bodyGrey14,
              contentPadding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              filled: true,
              suffixIcon: GestureDetector(
                onTap: () => onSearch(context, txtSearch.text),
                child: const Icon(
                  Icons.search,
                  color: ColorPalettes.darkPrimary,
                ),
              ),
            ),
            style: CustomTextStyle.bodyBlack14,
            controller: txtSearch,
            onFieldSubmitted: (value) => onSearch(context, value),
          ),
        ),
      ),
    );
  }

  onSearch(BuildContext context, String value) {
    if (value.isEmpty) {
      return failedAlert(context, "Search can't be empty");
    }

    context.read<SearchBloc>().add(SearchNews(value));
    Navigation.intentWithoutBack(context, SearchesView.routeName);
  }
}
