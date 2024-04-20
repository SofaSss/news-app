part of 'news_list_bloc.dart';

sealed class NewsAppEvent extends Equatable{
  @override
  List<Object?> get props => [];
}


class ListNewsFetched extends NewsAppEvent{

}

class ChangeOffset extends NewsAppEvent {
  final int offset;
  ChangeOffset(this.offset);
}

class UpdatePages extends NewsAppEvent{}

class SearchNewsEvent extends NewsAppEvent{
  final String search;
  SearchNewsEvent(this.search);
}