// To parse this JSON data, do
//
//     final adminConsultantList = adminConsultantListFromJson(jsonString);

import 'dart:convert';

AdminConsultantList adminConsultantListFromJson(String str) =>
    AdminConsultantList.fromJson(json.decode(str));

String adminConsultantListToJson(AdminConsultantList data) =>
    json.encode(data.toJson());

class AdminConsultantList {
  bool status;
  Data data;
  String message;

  AdminConsultantList({
    required this.status,
    required this.data,
    required this.message,
  });

  factory AdminConsultantList.fromJson(Map<String, dynamic> json) =>
      AdminConsultantList(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  List<Case> cases;
  Pagination pagination;

  Data({
    required this.cases,
    required this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cases: List<Case>.from(json["cases"].map((x) => Case.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "cases": List<dynamic>.from(cases.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class Case {
  int id;
  int userId;
  dynamic doctorId;
  String title;
  String name;
  String age;
  String description;
  String history;
  String guid;
  DateTime createdAt;
  DateTime updatedAt;
  Status status;
  List<Media> media;
  Cvs? cvs;
  User user;
  dynamic doctor;

  Case({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.title,
    required this.name,
    required this.age,
    required this.description,
    required this.history,
    required this.guid,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.media,
    required this.cvs,
    required this.user,
    required this.doctor,
  });

  factory Case.fromJson(Map<String, dynamic> json) => Case(
        id: json["id"],
        userId: json["user_id"],
        doctorId: json["doctor_id"],
        title: json["title"],
        name: json["name"],
        age: json["age"],
        description: json["description"],
        history: json["history"],
        guid: json["guid"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: statusValues.map[json["status"]]!,
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        cvs: json["cvs"] == null ? null : Cvs.fromJson(json["cvs"]),
        user: User.fromJson(json["user"]),
        doctor: json["doctor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "doctor_id": doctorId,
        "title": title,
        "name": name,
        "age": age,
        "description": description,
        "history": history,
        "guid": guid,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status": statusValues.reverse[status],
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
        "cvs": cvs?.toJson(),
        "user": user.toJson(),
        "doctor": doctor,
      };
}

class Cvs {
  int id;
  String? hypertension;
  String? valvular;
  String? angina;
  String? myocardial;
  String? infective;
  String? failure;
  String? surgery;
  String? others;
  String guid;
  int caseId;
  DateTime createdAt;
  DateTime updatedAt;
  String? nausea;
  String? vomiting;
  String? peptic;
  String? gutOthers;
  String? chestPain;
  String? asthma;
  String? bronchitis;
  String? pneumonia;
  String? respOthers;
  dynamic tuberculossis;
  String? tuberOthers;
  String? hepatitis;
  dynamic hepOthers;
  String? anemia;
  String? bleedingDisorder;
  String? clothingDisorder;
  String? leukemia;
  String? circulatoryOthers;
  String? uti;
  dynamic kenalFailure;
  String? urinaryOthers;
  String? seizure;
  String? epilepsy;
  String? nervousOthers;
  String? diabetes;
  dynamic hyperparathyrodism;
  dynamic hyperthyrodism;
  dynamic hyperthyrodismNew;
  String? endocrineOthers;

  Cvs({
    required this.id,
    required this.hypertension,
    required this.valvular,
    required this.angina,
    required this.myocardial,
    required this.infective,
    required this.failure,
    required this.surgery,
    required this.others,
    required this.guid,
    required this.caseId,
    required this.createdAt,
    required this.updatedAt,
    required this.nausea,
    required this.vomiting,
    required this.peptic,
    required this.gutOthers,
    required this.chestPain,
    required this.asthma,
    required this.bronchitis,
    required this.pneumonia,
    required this.respOthers,
    required this.tuberculossis,
    required this.tuberOthers,
    required this.hepatitis,
    required this.hepOthers,
    required this.anemia,
    required this.bleedingDisorder,
    required this.clothingDisorder,
    required this.leukemia,
    required this.circulatoryOthers,
    required this.uti,
    required this.kenalFailure,
    required this.urinaryOthers,
    required this.seizure,
    required this.epilepsy,
    required this.nervousOthers,
    required this.diabetes,
    required this.hyperparathyrodism,
    required this.hyperthyrodism,
    required this.hyperthyrodismNew,
    required this.endocrineOthers,
  });

  factory Cvs.fromJson(Map<String, dynamic> json) => Cvs(
        id: json["id"],
        hypertension: json["hypertension"],
        valvular: json["valvular"],
        angina: json["angina"],
        myocardial: json["myocardial"],
        infective: json["infective"],
        failure: json["failure"],
        surgery: json["surgery"],
        others: json["others"],
        guid: json["guid"],
        caseId: json["case_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        nausea: json["nausea"],
        vomiting: json["vomiting"],
        peptic: json["peptic"],
        gutOthers: json["gut_others"],
        chestPain: json["chest_pain"],
        asthma: json["asthma"],
        bronchitis: json["bronchitis"],
        pneumonia: json["pneumonia"],
        respOthers: json["resp_others"],
        tuberculossis: json["tuberculossis"],
        tuberOthers: json["tuber_others"],
        hepatitis: json["hepatitis"],
        hepOthers: json["hep_others"],
        anemia: json["anemia"],
        bleedingDisorder: json["bleeding_disorder"],
        clothingDisorder: json["clothing_disorder"],
        leukemia: json["leukemia"],
        circulatoryOthers: json["circulatory_others"],
        uti: json["uti"],
        kenalFailure: json["kenal_failure"],
        urinaryOthers: json["urinary_others"],
        seizure: json["seizure"],
        epilepsy: json["epilepsy"],
        nervousOthers: json["nervous_others"],
        diabetes: json["diabetes"],
        hyperparathyrodism: json["hyperparathyrodism"],
        hyperthyrodism: json["hyperthyrodism"],
        hyperthyrodismNew: json["hyperthyrodism_new"],
        endocrineOthers: json["endocrine_others"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hypertension": hypertension,
        "valvular": valvular,
        "angina": angina,
        "myocardial": myocardial,
        "infective": infective,
        "failure": failure,
        "surgery": surgery,
        "others": others,
        "guid": guid,
        "case_id": caseId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "nausea": nausea,
        "vomiting": vomiting,
        "peptic": peptic,
        "gut_others": gutOthers,
        "chest_pain": chestPain,
        "asthma": asthma,
        "bronchitis": bronchitis,
        "pneumonia": pneumonia,
        "resp_others": respOthers,
        "tuberculossis": tuberculossis,
        "tuber_others": tuberOthers,
        "hepatitis": hepatitis,
        "hep_others": hepOthers,
        "anemia": anemia,
        "bleeding_disorder": bleedingDisorder,
        "clothing_disorder": clothingDisorder,
        "leukemia": leukemia,
        "circulatory_others": circulatoryOthers,
        "uti": uti,
        "kenal_failure": kenalFailure,
        "urinary_others": urinaryOthers,
        "seizure": seizure,
        "epilepsy": epilepsy,
        "nervous_others": nervousOthers,
        "diabetes": diabetes,
        "hyperparathyrodism": hyperparathyrodism,
        "hyperthyrodism": hyperthyrodism,
        "hyperthyrodism_new": hyperthyrodismNew,
        "endocrine_others": endocrineOthers,
      };
}

class Media {
  int id;
  ModelType modelType;
  int modelId;
  String uuid;
  CollectionName collectionName;
  String name;
  String fileName;
  MimeType mimeType;
  Disk disk;
  Disk conversionsDisk;
  int size;
  List<dynamic> manipulations;
  List<dynamic> customProperties;
  List<dynamic> generatedConversions;
  List<dynamic> responsiveImages;
  int orderColumn;
  DateTime createdAt;
  DateTime updatedAt;
  String originalUrl;
  String previewUrl;

  Media({
    required this.id,
    required this.modelType,
    required this.modelId,
    required this.uuid,
    required this.collectionName,
    required this.name,
    required this.fileName,
    required this.mimeType,
    required this.disk,
    required this.conversionsDisk,
    required this.size,
    required this.manipulations,
    required this.customProperties,
    required this.generatedConversions,
    required this.responsiveImages,
    required this.orderColumn,
    required this.createdAt,
    required this.updatedAt,
    required this.originalUrl,
    required this.previewUrl,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        modelType: modelTypeValues.map[json["model_type"]]!,
        modelId: json["model_id"],
        uuid: json["uuid"],
        collectionName: collectionNameValues.map[json["collection_name"]]!,
        name: json["name"],
        fileName: json["file_name"],
        mimeType: mimeTypeValues.map[json["mime_type"]]!,
        disk: diskValues.map[json["disk"]]!,
        conversionsDisk: diskValues.map[json["conversions_disk"]]!,
        size: json["size"],
        manipulations: List<dynamic>.from(json["manipulations"].map((x) => x)),
        customProperties:
            List<dynamic>.from(json["custom_properties"].map((x) => x)),
        generatedConversions:
            List<dynamic>.from(json["generated_conversions"].map((x) => x)),
        responsiveImages:
            List<dynamic>.from(json["responsive_images"].map((x) => x)),
        orderColumn: json["order_column"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        originalUrl: json["original_url"],
        previewUrl: json["preview_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "model_type": modelTypeValues.reverse[modelType],
        "model_id": modelId,
        "uuid": uuid,
        "collection_name": collectionNameValues.reverse[collectionName],
        "name": name,
        "file_name": fileName,
        "mime_type": mimeTypeValues.reverse[mimeType],
        "disk": diskValues.reverse[disk],
        "conversions_disk": diskValues.reverse[conversionsDisk],
        "size": size,
        "manipulations": List<dynamic>.from(manipulations.map((x) => x)),
        "custom_properties": List<dynamic>.from(customProperties.map((x) => x)),
        "generated_conversions":
            List<dynamic>.from(generatedConversions.map((x) => x)),
        "responsive_images": List<dynamic>.from(responsiveImages.map((x) => x)),
        "order_column": orderColumn,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "original_url": originalUrl,
        "preview_url": previewUrl,
      };
}

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

class User {
  int id;
  Name name;
  Email email;
  DateTime emailVerifiedAt;
  HospitalName hospitalName;
  Address address;
  String licenseNumber;
  Specialization specialization;
  String experience;
  dynamic phoneCountryCode;
  dynamic phoneCode;
  String phoneNumber;
  int isUser;
  int status;
  Provider provider;
  dynamic fcmToken;
  dynamic accessToken;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.hospitalName,
    required this.address,
    required this.licenseNumber,
    required this.specialization,
    required this.experience,
    required this.phoneCountryCode,
    required this.phoneCode,
    required this.phoneNumber,
    required this.isUser,
    required this.status,
    required this.provider,
    required this.fcmToken,
    required this.accessToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        email: emailValues.map[json["email"]]!,
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        hospitalName: hospitalNameValues.map[json["hospital_name"]]!,
        address: addressValues.map[json["address"]]!,
        licenseNumber: json["license_number"],
        specialization: specializationValues.map[json["specialization"]]!,
        experience: json["experience"],
        phoneCountryCode: json["phone_country_code"],
        phoneCode: json["phone_code"],
        phoneNumber: json["phone_number"],
        isUser: json["is_user"],
        status: json["status"],
        provider: providerValues.map[json["provider"]]!,
        fcmToken: json["fcm_token"],
        accessToken: json["access_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "email": emailValues.reverse[email],
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "hospital_name": hospitalNameValues.reverse[hospitalName],
        "address": addressValues.reverse[address],
        "license_number": licenseNumber,
        "specialization": specializationValues.reverse[specialization],
        "experience": experience,
        "phone_country_code": phoneCountryCode,
        "phone_code": phoneCode,
        "phone_number": phoneNumber,
        "is_user": isUser,
        "status": status,
        "provider": providerValues.reverse[provider],
        "fcm_token": fcmToken,
        "access_token": accessToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

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

class Pagination {
  int total;
  int page;
  int pageSize;
  int totalPages;
  int remaining;
  int nextPage;
  int prevPage;

  Pagination({
    required this.total,
    required this.page,
    required this.pageSize,
    required this.totalPages,
    required this.remaining,
    required this.nextPage,
    required this.prevPage,
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
