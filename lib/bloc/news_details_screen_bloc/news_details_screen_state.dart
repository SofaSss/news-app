part of 'news_details_screen_bloc.dart';

class NewsDetailsScreenState {}

class NewsDetailsScreenInitial extends NewsDetailsScreenState {}

class NewsDetailsScreenLoading extends NewsDetailsScreenState {}

class NewsDetailsScreenLoaded extends NewsDetailsScreenState {
  NewsDetailsScreenLoaded({required this.newsById});
  final NewsModel newsById;
}

class NewsDetailsScreenError extends NewsDetailsScreenState{
  NewsDetailsScreenError({ required this.exception});
  final Object? exception;
}
