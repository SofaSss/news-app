import 'package:auto_route/annotations.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsAppBloc, NewsListState>(
      builder: (context, state) {
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

                    IconButton(
                        onPressed: (){
                          var user = getAuthBloc().state.user;
                          if(user == null) {
                            getTabsBloc().add(ChangeTabs(2));
                          }
                        },
                        icon: const Icon(Icons.star_border))
                  ],
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}
