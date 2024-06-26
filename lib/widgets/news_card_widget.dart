import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:news_app/bloc/news_list_bloc/news_list_bloc.dart';

import '../bloc/tabs/tabs_bloc.dart';
import '../pages/news_details_screen.dart';

class NewsCardWidget extends StatefulWidget {
  final int index;

  const NewsCardWidget({super.key, required this.index});

  @override
  State<NewsCardWidget> createState() => _NewsCardWidgetState();
}

class _NewsCardWidgetState extends State<NewsCardWidget> {
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
          final currentArticle = state.news[widget.index];
          final isFilled = authState.user != null &&
              authState.user!.user_articles
                  .any((a) => a.article_id == currentArticle.id);
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailsScreen(
                    id: state.news[widget.index].id,
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
                      state.news[widget.index].image_url,
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
                              state.news[widget.index].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              state.news[widget.index].summary,
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
                                    setLoading(false);
                                  }));
                                } else {
                                  getAuthBloc().add(
                                      AddUserArticle(currentArticle.id, () {
                                    setLoading(false);
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
