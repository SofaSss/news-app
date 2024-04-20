import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/pages/news_page.dart';
import 'package:news_app/repositories/news/news_repository.dart';
import 'package:news_app/themes/theme.dart';
import 'bloc/news_list_bloc/news_list_bloc.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: AppLocalizations.delegate.supportedLocales,
      theme: Themes.lightTheme,
      // routerConfig: _appRouter.config(),
      home: BlocProvider(
        create: (BuildContext context) => NewsAppBloc(NewsRepository()),
        child: const NewsPage(),
      ),
    );
  }
}
