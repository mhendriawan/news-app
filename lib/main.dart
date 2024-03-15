import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/headline/headline.dart';
import 'package:news_app/feature/search/bloc/bloc.dart';
import 'package:news_app/feature/search/view/view.dart';
import 'package:news_app/shared/shared.dart';

import 'core/core.dart';

void main() async {
  Bloc.observer = const SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await injectInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => inject<HeadlineBloc>(),
        ),
        BlocProvider(
          create: (context) => inject<SearchBloc>(),
        ),
      ],
      child: MaterialApp(
        title: AppConstant.appName,
        initialRoute: HeadlineView.routeName,
        routes:{
          HeadlineView.routeName: (context) => const HeadlineView(),
          SearchView.routeName: (context) => const SearchView(),
          SearchesView.routeName: (context) => const SearchesView(),
        },
      ),
    );
  }
}
