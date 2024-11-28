import 'dart:convert';

AdminConsultantList adminConsultantListFromJson(String str) =>
    AdminConsultantList.fromJson(json.decode(str));

String adminConsultantListToJson(AdminConsultantList data) =>
    json.encode(data.toJson());

class AdminConsultantList {
  bool? status; // Nullable bool
  Data? data; // Nullable Data
  String? message; // Nullable String

  AdminConsultantList({
    this.status,
    this.data,
    this.message,
  });

  factory AdminConsultantList.fromJson(Map<String, dynamic> json) =>
      AdminConsultantList(
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
  List<Case>? cases; // Nullable List<Case>
  // Pagination? pagination; // Nullable Pagination

  Data({
    this.cases,
    // this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cases: json["cases"] != null
            ? List<Case>.from(json["cases"].map((x) => Case.fromJson(x)))
            : null,
        // pagination: json["pagination"] != null
        //     ? Pagination.fromJson(json["pagination"])
        //     : null,
      );

  Map<String, dynamic> toJson() => {
        "cases": cases != null
            ? List<dynamic>.from(cases!.map((x) => x.toJson()))
            : [],
        // "pagination": pagination?.toJson(),
      };
}

class Case {
  int? id;
  String? guid;
  String? title; // Nullable String
  String? description; // Nullable String
  // List<Media>? media; // Nullable List<Media>

  Case({
    this.id,
    this.title,
    this.description,
    this.guid,
  });

  factory Case.fromJson(Map<String, dynamic> json) => Case(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        guid: json["guid"],
        // media: json["media"] != null
        //     ? List<Media>.from(json["media"].map((x) => Media.fromJson(x)))
        //     : null,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
        "description": description,
        "guid": guid,
        // "media": media != null
        //     ? List<dynamic>.from(media!.map((x) => x.toJson()))
        //     : [],
      };
}

// class Media {
//   String? originalUrl; // Nullable String

//   Media({
//     this.originalUrl,
//   });

//   factory Media.fromJson(Map<String, dynamic> json) => Media(
//         originalUrl: json["original_url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "original_url": originalUrl,
//       };
// }

enum CollectionName { PRESCRIPTION }

final collectionNameValues =
    EnumValues({"prescription": CollectionName.PRESCRIPTION});

enum Disk { PUBLIC }

final diskValues = EnumValues({"public": Disk.PUBLIC});

enum MimeType { IMAGE_JPEG }

final mimeTypeValues = EnumValues({"image/jpeg": MimeType.IMAGE_JPEG});

enum ModelType { APP_MODELS_PATIENT_CASE }

final modelTypeValues =
    EnumValues({"App\\Models\\PatientCase": ModelType.APP_MODELS_PATIENT_CASE});

enum Status { PENDING }

final statusValues = EnumValues({"Pending": Status.PENDING});

enum Address { ASD, KHJH }

final addressValues = EnumValues({"asd": Address.ASD, "khjh": Address.KHJH});

enum Email { TEST13_YOPMAIL_COM, TESTUSER1_YOPMAIL_COM }

final emailValues = EnumValues({
  "test13@yopmail.com": Email.TEST13_YOPMAIL_COM,
  "testuser1@yopmail.com": Email.TESTUSER1_YOPMAIL_COM
});

enum HospitalName { DSFDSF, JHJH }

final hospitalNameValues =
    EnumValues({"dsfdsf": HospitalName.DSFDSF, "jhjh": HospitalName.JHJH});

enum Name { JHJH, SD }

final nameValues = EnumValues({"jhjh": Name.JHJH, "sd": Name.SD});

enum Provider { DEFAULT }

final providerValues = EnumValues({"Default": Provider.DEFAULT});

enum Specialization { AS, GHG }

final specializationValues =
    EnumValues({"as": Specialization.AS, "ghg": Specialization.GHG});

// class Pagination {
//   int? total; // Nullable int
//   int? page; // Nullable int
//   int? pageSize; // Nullable int
//   int? totalPages; // Nullable int
//   int? remaining; // Nullable int
//   int? nextPage; // Nullable int
//   int? prevPage; // Nullable int

//   Pagination({
//     this.total,
//     this.page,
//     this.pageSize,
//     this.totalPages,
//     this.remaining,
//     this.nextPage,
//     this.prevPage,
//   });

//   factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//         total: json["total"],
//         page: json["page"],
//         pageSize: json["page_size"],
//         totalPages: json["total_pages"],
//         remaining: json["remaining"],
//         nextPage: json["next_page"],
//         prevPage: json["prev_page"],
//       );

//   Map<String, dynamic> toJson() => {
//         "total": total,
//         "page": page,
//         "page_size": pageSize,
//         "total_pages": totalPages,
//         "remaining": remaining,
//         "next_page": nextPage,
//         "prev_page": prevPage,
//       };
// }

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
