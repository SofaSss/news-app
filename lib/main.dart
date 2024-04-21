import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:news_app/bloc/tabs/tabs_bloc.dart';
import 'package:news_app/pages/news_page.dart';
import 'package:news_app/pages/sign_up.dart';
import 'package:news_app/repositories/news/news_repository.dart';
import 'package:news_app/repositories/news/users_api.dart';
import 'package:news_app/themes/theme.dart';
import 'package:retrofit/dio.dart';
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

final baseHeaders = <String, String>{"Content-Type": "application/json"};

class _NewsAppState extends State<NewsApp> {
  final dio = Dio(BaseOptions(headers: baseHeaders));

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
      home: MultiBlocProvider(
          providers: [
            BlocProvider<NewsAppBloc>(
              create: (BuildContext context) => NewsAppBloc(NewsRepository()),
            ),
            BlocProvider<AuthBloc>(
              create: (BuildContext context) => AuthBloc(UserRepository(dio)),
            ),
            BlocProvider<TabsBloc>(
              create: (BuildContext context) => TabsBloc(),
            ),
          ],
          child: const NewsPage()),
    );
  }
}
