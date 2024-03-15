import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/shared.dart';
import '../headline.dart';

class HeadlineView extends StatefulWidget {
  static const routeName = '/headline-news';

  const HeadlineView({Key? key}) : super(key: key);

  @override
  State<HeadlineView> createState() => _HeadlineViewState();
}

class _HeadlineViewState extends State<HeadlineView> {
  _loadHeadlineNews(BuildContext context) {
    context.read<HeadlineBloc>().add(HeadlineFetched());
  }

  @override
  void initState() {
    super.initState();
    _loadHeadlineNews(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeadlineBloc, HeadlineState>(
      builder: (context, state) {
        if (state is HeadlineHasData) {
          return HeadlinesView(headlines: state.result.headlines);
        } else if (state is HeadlineLoading) {
          return const SimpleLoadingWidget();
        } else if (state is HeadlineError) {
          return CustomErrorWidget(message: state.errorMessage);
        } else if (state is HeadlineNoData) {
          return CustomErrorWidget(message: state.message);
        } else if (state is HeadlineNoInternetConnection) {
          return NoInternetWidget(
            message: AppConstant.noInternetConnection,
            onPressed: () => _loadHeadlineNews(context),
          );
        } else {
          return const Center(child: Text(""));
        }
      },
    );
  }
}
