part of 'tabs_bloc.dart';



final class TabsState extends Equatable  {
  final int tabIndex;

  const TabsState({this.tabIndex = 0});

  TabsState copyWith({
    int? tabIndex,
  }) {
    return TabsState(
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }

  @override
  List<Object?> get props => [tabIndex];

  @override
  String toString() {
    return 'TabsState{tabIndex: $tabIndex}';
  }
}
