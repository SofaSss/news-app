import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'tabs_event.dart';
part 'tabs_state.dart';

class TabsBloc extends Bloc<TabsEvent, TabsState> {
  TabsBloc() : super(TabsState()) {
    on<ChangeTabs>((event, emit) {
      emit(state.copyWith(tabIndex: event.tabIndex));

    });
  }
}
