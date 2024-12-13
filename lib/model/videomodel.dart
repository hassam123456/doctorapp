import 'dart:convert';

VideoModel videoModelFromJson(String str) =>
    VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  bool? status; // Made nullable
  Data? data; // Made nullable
  String? message; // Made nullable

  VideoModel({
    this.status,
    this.data,
    this.message,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        status: json["status"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  List<Video>? videos; // Made nullable
  Pagination? pagination; // Made nullable

  Data({
    this.videos,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        videos: json["videos"] != null
            ? List<Video>.from(json["videos"].map((x) => Video.fromJson(x)))
            : null,
        pagination: json["pagination"] != null
            ? Pagination.fromJson(json["pagination"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "videos": videos != null
            ? List<dynamic>.from(videos!.map((x) => x.toJson()))
            : [],
        "pagination": pagination?.toJson(),
      };
}

class Pagination {
  dynamic total; // Made nullable
  dynamic page; // Made nullable
  dynamic pageSize; // Made nullable
  dynamic totalPages; // Made nullable

  Pagination({
    this.total,
    this.page,
    this.pageSize,
    this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        page: json["page"],
        pageSize: json["page_size"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "page_size": pageSize,
        "total_pages": totalPages,
      };
}

class Video {
  int? id; // Made nullable
  String? title; // Made nullable
  String? guid; // Made nullable
  String? category; // Made nullable
  String? description; // Made nullable
  String? url; // Made nullable
  int? status; // Made nullable
  List<Media>? media; // Made nullable

  Video({
    this.id,
    this.title,
    this.guid,
    this.category,
    this.description,
    this.url,
    this.status,
    this.media,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        title: json["title"],
        guid: json["guid"],
        category: json["category"],
        description: json["description"],
        url: json["url"],
        status: json["status"],
        media: json["media"] != null
            ? List<Media>.from(json["media"].map((x) => Media.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "guid": guid,
        "category": category,
        "description": description,
        "url": url,
        "status": status,
        "media": media != null
            ? List<dynamic>.from(media!.map((x) => x.toJson()))
            : [],
      };
}

class Media {
  int? id; // Made nullable
  String? originalUrl; // Made nullable

  Media({
    this.id,
    this.originalUrl,
  });

  factory Media.fromJson(Map<String, dynamic> json) =>
      Media(id: json["id"], originalUrl: json["original_url"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "original_url": originalUrl,
      };
}
