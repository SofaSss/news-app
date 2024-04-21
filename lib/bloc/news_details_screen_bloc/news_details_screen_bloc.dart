import 'package:bloc/bloc.dart';

import '../../repositories/models/news_model.dart';
import '../../repositories/news/news_repository.dart';

part 'news_details_screen_event.dart';
part 'news_details_screen_state.dart';

class NewsDetailsScreenBloc extends Bloc<NewsDetailsScreenEvent, NewsDetailsScreenState> {
  NewsDetailsScreenBloc(this.newsRepository) : super(NewsDetailsScreenInitial()) {
    on<LoadNewsDetailsScreenEvent>((event, emit) async{
      try {
        emit(NewsDetailsScreenLoading());
        final getNewsById = await newsRepository.getNewsById(event.id); //
        emit(NewsDetailsScreenLoaded(newsById: getNewsById));
      } catch (e){
        emit(NewsDetailsScreenError(exception: e));
      }
    },
    );
  }

  final NewsRepository newsRepository;

}



