import 'package:flutter/material.dart';
import 'package:news_app/news.dart';
import 'package:news_app/repositories/models/news_t.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    Key? key,
    required this.future,
  }) : super(key: key);

  final Future<List<New>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<New>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final newsList = snapshot.data!;
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: newsList.length,
            itemBuilder: (BuildContext context, int index) {
              final news = newsList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => News(
                        id: news.id,
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          news.imageUrl,
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            news.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:  Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            news.summary,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:  Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
