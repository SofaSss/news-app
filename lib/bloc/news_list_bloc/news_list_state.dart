part of 'news_list_bloc.dart';

enum NewsListStatus {
  failure,
  loading,
  loaded,
}

final class NewsListState extends Equatable {
  //Возможность сравнивать объекты в Dart часто требует переопределения == оператора, а также hashCode.S
  const NewsListState({
    this.status = NewsListStatus.loading,
    this.news = const [],
    this.offset = 0,
    this.search = '',
  });

  final NewsListStatus status;
  final List<NewsModel> news;
  final int offset;
  final String search;

  NewsListState copyWith({
    NewsListStatus? status,
    List<NewsModel>? news,
    int? offset,
    String? search,
  }) {
    return NewsListState(
      status: status ?? this.status,
      news: news ?? this.news,
      offset: offset ?? this.offset,
      search: search ?? this.search,
    );
  }

  @override
  List<Object?> get props => [status, news, offset, search];

  @override
  String toString() {
    return 'NewsListState{status: $status, news: $news}';
  }
}
