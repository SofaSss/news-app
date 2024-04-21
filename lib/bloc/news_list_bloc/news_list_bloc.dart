import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/repositories/news/news_repository.dart';
import '../../repositories/models/news_model.dart';

part 'news_list_event.dart';
part 'news_list_state.dart';

class NewsAppBloc extends Bloc<NewsAppEvent, NewsListState> {
  NewsAppBloc(this.newsRepository) : super(const NewsListState()) {
    on<ListNewsFetched>(_listNewsFetched);
    on<ChangeOffset>(_changeOffset);
    on<UpdatePages>(_updatePages);
    on<SearchNewsEvent>(_searchNewsEvent);
  }

  final NewsRepository newsRepository;

  Future<void> _listNewsFetched(
      ListNewsFetched event, Emitter<NewsListState> emit) async {
    try {
      final  newsList = await newsRepository.getNewsList(offset: state.offset, search: state.search);
      emit(state.copyWith(
        status: NewsListStatus.loaded,
        news: [...state.news, ...newsList],
      ));
    } catch (_) {
      emit(state.copyWith(status: NewsListStatus.failure));
    }
  }

  void _changeOffset(ChangeOffset event , Emitter<NewsListState> emit) {
    emit(state.copyWith(
      offset: event.offset
    ));
  }

  Future<void> _updatePages (UpdatePages event, Emitter<NewsListState> emit) async{
    final newsList = await newsRepository.getNewsList(search: state.search);
    emit(state.copyWith(
      offset: 0,
      news: newsList,
    ));
  }

  void _searchNewsEvent(SearchNewsEvent event, Emitter<NewsListState> emit) {
    emit(state.copyWith(
     search: event.search,
    ));
  }
}

