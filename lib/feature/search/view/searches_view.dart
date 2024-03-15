import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/shared.dart';
import '../search.dart';

class SearchesView extends StatelessWidget {
  static const routeName = '/searches-news';

  const SearchesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchHasData) {
          return SearchesResultView(searches: state.result.searches);
        } else if (state is SearchLoading) {
          return const SimpleLoadingWidget();
        } else if (state is SearchError) {
          return CustomErrorWidget(message: state.errorMessage);
        } else if (state is SearchNoData) {
          return CustomErrorWidget(message: state.message);
        } else if (state is SearchNoInternetConnection) {
          return NoInternetWidget(
            message: AppConstant.noInternetConnection,
            onPressed: () => Navigator.pop(context),
          );
        } else {
          return const Center(child: Text(""));
        }
      },
    );
  }
}
