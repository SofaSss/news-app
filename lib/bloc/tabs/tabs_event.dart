part of 'tabs_bloc.dart';

@immutable
sealed class TabsEvent {}


class ChangeTabs extends TabsEvent {
  final int tabIndex;

  ChangeTabs(this.tabIndex);
}