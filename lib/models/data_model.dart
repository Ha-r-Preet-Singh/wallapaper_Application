import 'package:wallpaper_app/models/photo_model.dart';

class DataModel {
  int? page;
  int? per_page;
  List<PhotosModel>? photos;
  int? total_results;
  String? next_page;

  DataModel(
      {this.page, this.per_page, this.photos, this.total_results, this.next_page});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<PhotosModel> mProducts = [];

    for (Map<String, dynamic> eachPhotos in json["photos"]) {
      mProducts.add(PhotosModel.fromJson(eachPhotos));
    }

    return DataModel(
      page: json["page"],
      per_page: json["per_page"],
      photos: mProducts,
      total_results: json["total_results"],
      next_page: json["next_page"],
    );
  }
}
