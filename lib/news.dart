import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/repositories/news/news_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class News extends StatefulWidget {
  const News({super.key, required this.id});

  final int id;

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final NewsRepository newsRepository = NewsRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: newsRepository.getNewsById(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final newsById = snapshot.data!;

            return Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        newsById.imageUrl,
                        width: 397,
                        height: 215,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    newsById.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Expanded(
                      child: SizedBox(
                        height: 200,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            newsById.summary,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                       launchUrl(Uri.parse(newsById.url));
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(236, 40),
                      shape: const ContinuousRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Row(
                      children: [
                        Transform.rotate(
                          angle: -math.pi / 4.0,
                          child: const Icon(
                            Icons.link,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          
                            child:  Text(
                              AppLocalizations.of(context)!.goToTheSource,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                           
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

//вынести стили в отдельный класс тема в папке ресурсы
//вынести в локализацию
