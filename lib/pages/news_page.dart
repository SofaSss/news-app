import 'package:flutter/material.dart';
import 'package:news_app/pages/counter.dart';
import 'package:news_app/pages/news_list.dart';
import '../generated/l10n.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    NewsList(),
    Counter(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(8, 108, 201, 1.0),
        centerTitle: true,
        title: Text(
          _selectedIndex == 0
              ? AppLocalizations.of(context).allNews
              : AppLocalizations.of(context).counter,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(217, 234, 250, 1.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 75,
              child: DrawerHeader(
                child: Text(
                  AppLocalizations.of(context).Menu,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context).News),
              trailing: const Icon(Icons.newspaper),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Избранное'),
              trailing: const Icon(Icons.favorite),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
