part of 'news_details_screen_bloc.dart';

class NewsDetailsScreenEvent {
}


class LoadNewsDetailsScreenEvent extends NewsDetailsScreenEvent{
  final int id;
  LoadNewsDetailsScreenEvent({required this.id});
}