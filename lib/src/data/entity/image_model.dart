// To parse this JSON data, do
//
//     final imageModel = imageModelFromJson(jsonString);

import 'dart:convert';

ImageModel imageModelFromJson(String str) => ImageModel.fromJson(json.decode(str));

String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
  final SearchParameters? searchParameters;
  final List<Images>? images;
  final int? credits;

  ImageModel({
    this.searchParameters,
    this.images,
    this.credits,
  });

  ImageModel copyWith({
    SearchParameters? searchParameters,
    List<Images>? images,
    int? credits,
  }) =>
      ImageModel(
        searchParameters: searchParameters ?? this.searchParameters,
        images: images ?? this.images,
        credits: credits ?? this.credits,
      );

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    searchParameters: json["searchParameters"] == null ? null : SearchParameters.fromJson(json["searchParameters"]),
    images: json["images"] == null ? [] : List<Images>.from(json["images"]!.map((x) => Images.fromJson(x))),
    credits: json["credits"],
  );

  Map<String, dynamic> toJson() => {
    "searchParameters": searchParameters?.toJson(),
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "credits": credits,
  };
}

class Images {
  final String? title;
  final String? imageUrl;
  final int? imageWidth;
  final int? imageHeight;
  final String? thumbnailUrl;
  final int? thumbnailWidth;
  final int? thumbnailHeight;
  final String? source;
  final String? domain;
  final String? link;
  final String? googleUrl;
  final int? position;

  Images({
    this.title,
    this.imageUrl,
    this.imageWidth,
    this.imageHeight,
    this.thumbnailUrl,
    this.thumbnailWidth,
    this.thumbnailHeight,
    this.source,
    this.domain,
    this.link,
    this.googleUrl,
    this.position,
  });

  Images copyWith({
    String? title,
    String? imageUrl,
    int? imageWidth,
    int? imageHeight,
    String? thumbnailUrl,
    int? thumbnailWidth,
    int? thumbnailHeight,
    String? source,
    String? domain,
    String? link,
    String? googleUrl,
    int? position,
  }) =>
      Images(
        title: title ?? this.title,
        imageUrl: imageUrl ?? this.imageUrl,
        imageWidth: imageWidth ?? this.imageWidth,
        imageHeight: imageHeight ?? this.imageHeight,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
        thumbnailWidth: thumbnailWidth ?? this.thumbnailWidth,
        thumbnailHeight: thumbnailHeight ?? this.thumbnailHeight,
        source: source ?? this.source,
        domain: domain ?? this.domain,
        link: link ?? this.link,
        googleUrl: googleUrl ?? this.googleUrl,
        position: position ?? this.position,
      );

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    title: json["title"],
    imageUrl: json["imageUrl"],
    imageWidth: json["imageWidth"],
    imageHeight: json["imageHeight"],
    thumbnailUrl: json["thumbnailUrl"],
    thumbnailWidth: json["thumbnailWidth"],
    thumbnailHeight: json["thumbnailHeight"],
    source: json["source"],
    domain: json["domain"],
    link: json["link"],
    googleUrl: json["googleUrl"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "imageUrl": imageUrl,
    "imageWidth": imageWidth,
    "imageHeight": imageHeight,
    "thumbnailUrl": thumbnailUrl,
    "thumbnailWidth": thumbnailWidth,
    "thumbnailHeight": thumbnailHeight,
    "source": source,
    "domain": domain,
    "link": link,
    "googleUrl": googleUrl,
    "position": position,
  };
}

class SearchParameters {
  final String? q;
  final String? type;
  final String? engine;
  final int? num;

  SearchParameters({
    this.q,
    this.type,
    this.engine,
    this.num,
  });

  SearchParameters copyWith({
    String? q,
    String? type,
    String? engine,
    int? num,
  }) =>
      SearchParameters(
        q: q ?? this.q,
        type: type ?? this.type,
        engine: engine ?? this.engine,
        num: num ?? this.num,
      );

  factory SearchParameters.fromJson(Map<String, dynamic> json) => SearchParameters(
    q: json["q"],
    type: json["type"],
    engine: json["engine"],
    num: json["num"],
  );

  Map<String, dynamic> toJson() => {
    "q": q,
    "type": type,
    "engine": engine,
    "num": num,
  };
}
