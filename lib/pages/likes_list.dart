import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:news_app/bloc/news_list_bloc/news_list_bloc.dart';
import 'package:news_app/repositories/models/news_model.dart';
import 'package:news_app/repositories/news/news_repository.dart';
import 'package:news_app/widgets/like_card.dart';

class LikesList extends StatefulWidget {
  const LikesList({
    super.key,
  });

  @override
  State<LikesList> createState() => _LikesListState();
}

//@RoutePage()
class _LikesListState extends State<LikesList> {
  final newsRepository = NewsRepository();

  AuthBloc getAuthBloc() {
    return BlocProvider.of<AuthBloc>(context);
  }

  bool isLoading = false;
  List<NewsModel> news = [];

  Future<void> setUserLikesNews() async {
    setState(() {
      isLoading = true;
    });

    final newNews =
        await newsRepository.geUsertNewsList(getAuthBloc().state.user!.id);
    setState(() {
      news = newNews;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setUserLikesNews();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
              onRefresh: () async {
                context.read<NewsAppBloc>().add(UpdatePages());
              },
              child: isLoading
                  ? const Center(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 1.5,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  : ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: news.length,
                      itemBuilder: (context, index) {
                        return LikeCardWidget(
                          news: news[index],
                          onFinish: setUserLikesNews,
                        );
                      },
                    )),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
