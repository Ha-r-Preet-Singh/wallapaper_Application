class SrcModel {
  String? original;
  String? large2x;
  String? large;
  String? medium;
  String? small;
  String? portrait;
  String? landscape;
  String? tiny;

  SrcModel(
      {this.original,
      this.large2x,
      this.large,
      this.medium,
      this.small,
      this.portrait,
      this.landscape,
      this.tiny});

  factory SrcModel.fromJson(Map<String, dynamic> json) {
    return SrcModel(
      original: json["original"],
      large2x: json["large2x"],
      large: json["large"],
      medium: json["medium"],
      small: json["small"],
      portrait: json["portrait"],
      landscape: json["landscape"],
      tiny: json["tiny"],
    );
  }
}
