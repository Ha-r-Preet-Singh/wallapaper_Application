import 'package:wallpaper_app/models/src_model.dart';

class PhotosModel {
  int? id;
  int? width;
  int? height;
  String? url;
  String? photographer;
  String? photographerUrl;
  int? photographerId;
  String? avgColor;
  SrcModel? src;
  bool? liked;
  String? alt;

  PhotosModel(
      {this.id,
      this.width,
      this.height,
      this.url,
      this.photographer,
      this.photographerUrl,
      this.photographerId,
      this.avgColor,
      this.src,
      this.liked,
      this.alt});

  factory PhotosModel.fromJson(Map<String, dynamic> json) {
    return PhotosModel(
      id: json["id"],
      width: json["width"],
      height: json["height"],
      url: json["url"],
      photographer: json["photographer"],
      photographerUrl: json["photographerUrl"],
      photographerId: json["photographerId"],
      avgColor: json["avgColor"],
      src: SrcModel.fromJson(json["src"]),
      liked: json["liked"],
      alt: json["alt"],
    );
  }
}
