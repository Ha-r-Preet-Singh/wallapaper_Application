import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app/api/api_helper.dart';
import 'package:wallpaper_app/api/urls.dart';
import 'package:wallpaper_app/app_exceptions.dart';
import 'package:wallpaper_app/models/data_model.dart';

part 'wallpaper_event.dart';
part 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  ApiHelper apiHelper;
  WallpaperBloc({required this.apiHelper}) : super(WallpaperInitialState()) {
    // on<GetTrendingWallpaper>((event, emit) async {
    //   emit(WallpaperLoadingState());
    //
    //   try {
    //     var res = await apiHelper.getApi("${Urls.treandingUrl}?per_page=20");
    //
    //     emit(WallpaperLoadedState(mData: DataModel.fromJson(res)));
    //   } catch (e) {
    //     emit(WallpaperErrorState(errorMsg: e.toString()));
    //   }
    // });

    on<GetSearchWallpaper>((event, emit) async {
      emit(WallpaperLoadingState());

      // var res = await apiHelper.getApi(
      //     "${Urls.searchUrl}?query=${event.query}&per_page=40&color=${event.colorCode ?? ""}");
      //
      // if (res != null) {
      //   emit(WallpaperLoadedState(mData: DataModel.fromJson(res)));
      // } else {
      //   emit(WallpaperErrorState(errorMsg: "Internet Error"));
      // }



      try{
        var res = await apiHelper.getApi(
            "${Urls.searchUrl}?query=${event.query}&per_page=40&page=${event.page}&color=${event.colorCode ?? ""}");
        emit(WallpaperLoadedState(mData: DataModel.fromJson(res)));

      }catch(e){
        emit(WallpaperErrorState(errorMsg: (e as AppExceptions).formattedError()));


      }
    });
  }
}
