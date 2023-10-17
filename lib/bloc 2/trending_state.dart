part of 'trending_bloc.dart';

@immutable
abstract class TrendingState {}

class TrendingInitialState extends TrendingState {}

class TrendingLoadingState extends TrendingState {}

class TrendingLoadedState extends TrendingState {
  DataModel myData;

  TrendingLoadedState({required this.myData});
}

class TrendingErrorState extends TrendingState {
  String errorMsg;

  TrendingErrorState({required this.errorMsg});
}
