import 'dart:convert';

ConsultantListModel consultantListModelFromJson(String str) =>
    ConsultantListModel.fromJson(json.decode(str));

String consultantListModelToJson(ConsultantListModel data) =>
    json.encode(data.toJson());

class ConsultantListModel {
  bool? status; // Nullable boolean
  Data? data; // Nullable Data
  String? message; // Nullable String

  ConsultantListModel({
    this.status,
    this.data,
    this.message,
  });

  factory ConsultantListModel.fromJson(Map<String, dynamic> json) =>
      ConsultantListModel(
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
  List<Doctor>? doctors; // Nullable List<Doctor>
  Pagination? pagination; // Nullable Pagination

  Data({
    this.doctors,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        doctors: json["doctors"] != null
            ? List<Doctor>.from(json["doctors"].map((x) => Doctor.fromJson(x)))
            : null,
        pagination: json["pagination"] != null
            ? Pagination.fromJson(json["pagination"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "doctors": doctors != null
            ? List<dynamic>.from(doctors!.map((x) => x.toJson()))
            : [],
        "pagination": pagination?.toJson(),
      };
}

class Media {
  String? originalUrl; // Nullable String

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

class Doctor {
  String? name; // Nullable String
  String? hospitalName; // Nullable String
  String? specialization; // Nullable String
  List<Media>? media; // Nullable List<Media>

  Doctor({
    this.name,
    this.hospitalName,
    this.specialization,
    this.media,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        name: json["name"],
        hospitalName: json["hospital_name"],
        specialization: json["specialization"],
        media: json["media"] != null
            ? List<Media>.from(json["media"].map((x) => Media.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "hospital_name": hospitalName,
        "specialization": specialization,
        "media": media != null
            ? List<dynamic>.from(media!.map((x) => x.toJson()))
            : [],
      };
}

class Pagination {
  int? total; // Nullable int
  int? page; // Nullable int
  int? pageSize; // Nullable int
  int? totalPages; // Nullable int
  int? remaining; // Nullable int
  int? nextPage; // Nullable int
  int? prevPage; // Nullable int

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
