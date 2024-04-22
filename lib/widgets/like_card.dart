import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:news_app/bloc/news_list_bloc/news_list_bloc.dart';
import 'package:news_app/repositories/models/news_model.dart';

import '../bloc/tabs/tabs_bloc.dart';
import '../pages/news_details_screen.dart';

class LikeCardWidget extends StatefulWidget {
  final NewsModel news;
  final Future<void> Function() onFinish;

  const LikeCardWidget({super.key, required this.news, required this.onFinish});

  @override
  State<LikeCardWidget> createState() => _NewsCardWidgetState();
}

class _NewsCardWidgetState extends State<LikeCardWidget> {
  AuthBloc getAuthBloc() {
    return BlocProvider.of<AuthBloc>(context);
  }

  TabsBloc getTabsBloc() {
    return BlocProvider.of<TabsBloc>(context);
  }

  bool isLoading = false;

  void setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsAppBloc, NewsListState>(
      builder: (context, state) {
        return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
          final currentArticle = widget.news;
          final isFilled = authState.user != null &&
              authState.user!.user_articles
                  .any((a) => a.article_id == currentArticle.id);
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailsScreen(
                    id: widget.news.id,
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
                      widget.news.image_url,
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const SizedBox(
                          height: 70,
                          width: 70,
                          child: Icon(Icons.image_outlined),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image_not_supported_outlined),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.news.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              widget.news.summary,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                      isLoading
                          ? const SizedBox(
                              height: 30,
                              width: 30,
                              child: Center(
                                child: SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 1.5,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                var user = authState.user;
                                if (user == null) {
                                  getTabsBloc().add(ChangeTabs(3));
                                  return;
                                }
                                setLoading(true);
                                if (isFilled) {
                                  getAuthBloc().add(
                                      RemoveUserArticle(currentArticle.id, () {
                                    widget.onFinish().then((value) {
                                      setLoading(false);
                                    });
                                  }));
                                } else {
                                  getAuthBloc().add(
                                      AddUserArticle(currentArticle.id, () {
                                    widget.onFinish().then((value) {
                                      setLoading(false);
                                    });
                                  }));
                                }
                              },
                              icon: Icon(
                                isFilled ? Icons.star : Icons.star_border,
                                color: isFilled
                                    ? const Color.fromARGB(255, 247, 218, 0)
                                    : null,
                              ))
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
