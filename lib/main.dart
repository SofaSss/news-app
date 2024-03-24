import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/news_list.dart';
import 'package:news_app/themes/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News app',
      //locale: Locale('en'),
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('en'), // English
      //   Locale('ru'),
      // ],
      localizationsDelegates: AppLocalizations.localizationsDelegates, //подключаемые модули которые отвечают за конкретные аспекты
      supportedLocales:  AppLocalizations.supportedLocales, //подключенные языки
      theme: createLightTheme(),

     home:  Builder(
       builder: (context) {
         return NewsList(
             title: AppLocalizations.of(context)?.allNews ?? 'cyka'  //если левый от ? равен нул, то генерация завершается
         );
       },
     ),
    );
  }
}


