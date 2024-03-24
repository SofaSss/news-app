import 'package:flutter/material.dart';
import 'package:news_app/news_tile.dart';
import 'package:news_app/repositories/news/news_repository.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.title});

  final String title;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final NewsRepository newsRepository = NewsRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
        ),
      ),
      body: NewsTile(
        future: newsRepository.getNewsList(),
      ),
    );
  }
}

//


