import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_details_screen_bloc/news_details_screen_bloc.dart';
import 'package:news_app/widgets/button_widget.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:news_app/repositories/news/news_repository.dart';
import '../widgets/image_widget.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({super.key, required this.id});

  final int id;

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (BuildContext context) =>
            NewsDetailsScreenBloc(NewsRepository())
              ..add(LoadNewsDetailsScreenEvent(id: widget.id)),
        child: Builder(builder: (context) {
          return RefreshIndicator(
            onRefresh: () async {
              context
                  .read<NewsDetailsScreenBloc>()
                  .add(LoadNewsDetailsScreenEvent(id: widget.id));
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: BlocBuilder<NewsDetailsScreenBloc, NewsDetailsScreenState>(
                builder: (context, state) {
                  if (state is NewsDetailsScreenLoading) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state is NewsDetailsScreenError) {
                    return Text(
                      AppLocalizations.of(context).error,
                    );
                  } else if (state is NewsDetailsScreenLoaded) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: const ImageWidget(),
                                ),
                              ),
                              Text(
                                state.newsById.title,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const Divider(),
                              Container(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Expanded(
                                  child: Text(
                                    state.newsById.summary,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 250),
                            child: const ButtonWidget(),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
