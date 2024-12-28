import 'dart:convert';

// To parse this JSON data, do
//
//     final ebookModel = ebookModelFromJson(jsonString);

EbookModel ebookModelFromJson(String str) =>
    EbookModel.fromJson(json.decode(str));

String ebookModelToJson(EbookModel data) => json.encode(data.toJson());

class EbookModel {
  bool? status;
  Data? data;
  String? message;

  EbookModel({
    this.status,
    this.data,
    this.message,
  });

  factory EbookModel.fromJson(Map<String, dynamic> json) => EbookModel(
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
  List<Ebook>? ebooks;
  Pagination? pagination;

  Data({
    this.ebooks,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ebooks: json["ebooks"] != null
            ? List<Ebook>.from(json["ebooks"].map((x) => Ebook.fromJson(x)))
            : null,
        pagination: json["pagination"] != null
            ? Pagination.fromJson(json["pagination"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "ebooks": ebooks != null
            ? List<dynamic>.from(ebooks!.map((x) => x.toJson()))
            : null,
        "pagination": pagination?.toJson(),
      };
}

class Ebook {
  Title? title;
  Category? category;
  Description? description;
  String? url;
  List<Media>? media;

  Ebook({
    this.title,
    this.category,
    this.description,
    this.url,
    this.media,
  });

  factory Ebook.fromJson(Map<String, dynamic> json) => Ebook(
        title: json["title"] != null ? titleValues.map[json["title"]] : null,
        category: json["category"] != null
            ? categoryValues.map[json["category"]]
            : null,
        description: json["description"] != null
            ? descriptionValues.map[json["description"]]
            : null,
        url: json["url"],
        media: json["media"] != null
            ? List<Media>.from(json["media"].map((x) => Media.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "title": title != null ? titleValues.reverse[title] : null,
        "category": category != null ? categoryValues.reverse[category] : null,
        "description":
            description != null ? descriptionValues.reverse[description] : null,
        "url": url,
        "media": media != null
            ? List<dynamic>.from(media!.map((x) => x.toJson()))
            : null,
      };
}

enum Category { SDSD, TB }

final categoryValues = EnumValues({"sdsd": Category.SDSD, "TB": Category.TB});

enum Description { SDFSDFDS, SDSD, SDSDSD }

final descriptionValues = EnumValues({
  "sdfsdfds": Description.SDFSDFDS,
  "sdsd": Description.SDSD,
  "sdsdsd": Description.SDSDSD
});

class Media {
  String? originalUrl;

  Media({
    this.originalUrl,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        originalUrl: json["original_url"],
      );

  Map<String, dynamic> toJson() => {
        "original_url": originalUrl,
      };
}

enum Title { NEW_EBOOK, SD, SDSD }

final titleValues = EnumValues(
    {"New Ebook": Title.NEW_EBOOK, "sd": Title.SD, "sdsd": Title.SDSD});

class Pagination {
  dynamic? total;
  dynamic? page;
  dynamic? pageSize;
  dynamic? totalPages;
  dynamic? remaining;
  dynamic? nextPage;
  dynamic? prevPage;

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
