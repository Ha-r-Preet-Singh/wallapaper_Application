import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app/api/api_helper.dart';
import 'package:wallpaper_app/api/urls.dart';
import 'package:wallpaper_app/bloc/wallpaper_bloc.dart';
import 'package:wallpaper_app/models/data_model.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  ApiHelper apiHelper;
  TrendingBloc({required this.apiHelper}) : super(TrendingInitialState()) {
    on<GetTrendingWallpaper>((event, emit) async {
      emit(TrendingLoadingState());

      try {
        var res = await apiHelper.getApi("${Urls.treandingUrl}?per_page=20");

        emit(TrendingLoadedState(myData: DataModel.fromJson(res)));
      } catch (e) {
        emit(TrendingErrorState(errorMsg: e.toString()));
      }
    });
  }
}
