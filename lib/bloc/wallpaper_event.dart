part of 'wallpaper_bloc.dart';

@immutable
abstract class WallpaperEvent {}

class GetSearchWallpaper extends WallpaperEvent {
  String query;
  String? colorCode;
  int page;
  GetSearchWallpaper(

       {required this.query,this.colorCode,required this.page});
}

class GetTrendingWallpaper extends WallpaperEvent {}
