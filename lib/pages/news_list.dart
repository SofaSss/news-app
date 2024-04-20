import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_list_bloc/news_list_bloc.dart';
import 'package:news_app/widgets/error_widget.dart';
import 'package:news_app/widgets/news_card_widget.dart';

import '../generated/l10n.dart';

class NewsList extends StatefulWidget {
  const NewsList({
    super.key,
  });

  @override
  State<NewsList> createState() => _NewsListState();
}

//@RoutePage()
class _NewsListState extends State<NewsList> {
  final _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  NewsAppBloc getBloc() {
    return BlocProvider.of<NewsAppBloc>(context);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    getBloc().add(ListNewsFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context).SearchNews,
              suffixIcon: IconButton(
                onPressed: () {
                  getBloc().add(SearchNewsEvent(_searchController.text));
                  getBloc().add(UpdatePages());
                },
                icon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<NewsAppBloc>().add(UpdatePages());
            },
            child: BlocBuilder<NewsAppBloc, NewsListState>(
              builder: (context, state) {
                switch (state.status) {
                  case NewsListStatus.loaded:
                    return ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                      controller: _scrollController,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: state.news.length + 1,
                      itemBuilder: (context, index) {
                        if (state.news.length <= index) {
                          return const Center(
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                                color: Colors.blue,
                              ),
                            ),
                          );
                        }
                        return NewsCardWidget(index: index);
                      },
                    );

                  case NewsListStatus.loading:
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    );
                  case NewsListStatus.failure: //is NewsAppError
                    return const ErrorNewsListWidget();
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      var newOffset = getBloc().state.offset + 10;
      getBloc().add(ChangeOffset(newOffset));
      getBloc().add(ListNewsFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= maxScroll;
  }
}
