import 'dart:convert';

VideoModel videoModelFromJson(String str) =>
    VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  bool status;
  Data? data; // Nullable data
  String message;

  VideoModel({
    required this.status,
    this.data, // Nullable data
    required this.message,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(), // Handle nullability of data
        "message": message,
      };
}

class Data {
  List<Video>? videos; // Nullable list
  Pagination? pagination; // Nullable pagination

  Data({
    this.videos, // Nullable videos
    this.pagination, // Nullable pagination
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        videos: json["videos"] == null
            ? null
            : List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "videos": videos == null
            ? []
            : List<dynamic>.from(videos!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

class Pagination {
  int? total; // Nullable
  int? page; // Nullable
  int? pageSize; // Nullable
  int? totalPages; // Nullable
  int? remaining; // Nullable
  int? nextPage; // Nullable
  int? prevPage; // Nullable

  Pagination({
    this.total,
    this.page,
    this.pageSize,
    this.totalPages,
    this.remaining,
    this.nextPage,
    this.prevPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        page: json["page"],
        pageSize: json["page_size"],
        totalPages: json["total_pages"],
        remaining: json["remaining"],
        nextPage: json["next_page"],
        prevPage: json["prev_page"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "page_size": pageSize,
        "total_pages": totalPages,
        "remaining": remaining,
        "next_page": nextPage,
        "prev_page": prevPage,
      };
}

class Video {
  Title title;

  Category category;
  String? description; // Nullable
  String url;

  List<Media>? media; // Nullable list

  Video({
    required this.title,
    required this.category,
    this.description, // Nullable description
    required this.url,
    this.media, // Nullable media
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        title: titleValues.map[json["title"]]!,

        category: categoryValues.map[json["category"]]!,
        description: json["description"], // Nullable
        url: json["url"],

        media: json["media"] == null
            ? null
            : List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": titleValues.reverse[title],
        "category": categoryValues.reverse[category],
        "description": description,
        "url": url,
        "media": media == null
            ? []
            : List<dynamic>.from(media!.map((x) => x.toJson())),
      };
}

enum Category { ASD, TB }

final categoryValues = EnumValues({"asd": Category.ASD, "TB": Category.TB});

class Media {
  String? originalUrl; // Nullable

  Media({
    this.originalUrl, // Nullable
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        originalUrl: json["original_url"], // Nullable
      );

  Map<String, dynamic> toJson() => {
        "original_url": originalUrl,
      };
}

enum Title { ASDS, NEW_VIDEO }

final titleValues =
    EnumValues({"asds": Title.ASDS, "New Video": Title.NEW_VIDEO});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
