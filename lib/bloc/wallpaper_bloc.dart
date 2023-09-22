import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app/api/api_helper.dart';
import 'package:wallpaper_app/api/urls.dart';
import 'package:wallpaper_app/models/data_model.dart';

part 'wallpaper_event.dart';
part 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {

  ApiHelper apiHelper;
  WallpaperBloc({required this.apiHelper}) : super(WallpaperInitialState()) {
    on<GetTrendingWallpaper>((event, emit)async {
    emit(WallpaperLoadingState());


    var res = await  apiHelper.getApi("${Urls.treandingUrl}?per_page=20");


    if(res!=null){
      emit(WallpaperLoadedState(mData: DataModel.fromJson(res)));

    }else{
      emit(WallpaperErrorState(errorMsg: "Internet Error"));
    }


    });




    on<GetSearchWallpaper>((event, emit)async {
      emit(WallpaperLoadingState());


      var res = await  apiHelper.getApi("${Urls.searchUrl}?query=${event.query}&per_page=20");


      if(res!=null){
        emit(WallpaperLoadedState(mData: DataModel.fromJson(res)));

      }else{
        emit(WallpaperErrorState(errorMsg: "Internet Error"));
      }

    });
  }
}
