import 'package:wallpaper_app/models/photo_model.dart';

class DataModel {
  int? page;
  int? perPage;
  List<PhotosModel>? photos;
  int? totalResults;
  String? nextPage;

  DataModel(
      {this.page, this.perPage, this.photos, this.totalResults, this.nextPage});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<PhotosModel> mProducts = [];

    for (Map<String, dynamic> eachPhotos in json["photos"]) {
      mProducts.add(PhotosModel.fromJson(eachPhotos));
    }

    return DataModel(
      page: json["page"],
      perPage: json["perPage"],
      photos: mProducts,
      totalResults: json["totalResults"],
      nextPage: json["nextPage"],
    );
  }
}
