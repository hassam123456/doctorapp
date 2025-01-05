import 'dart:convert';

AdminGetCaseByIdModel adminGetCaseByIdFromJson(String str) =>
    AdminGetCaseByIdModel.fromJson(json.decode(str));

String adminGetCaseByIdToJson(AdminGetCaseByIdModel data) =>
    json.encode(data.toJson());

class AdminGetCaseByIdModel {
  bool? status;
  Data? data;
  String? message;

  AdminGetCaseByIdModel({
    this.status,
    this.data,
    this.message,
  });

  factory AdminGetCaseByIdModel.fromJson(Map<String, dynamic> json) =>
      AdminGetCaseByIdModel(
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
  Cases? cases;

  Data({
    this.cases,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cases: json["cases"] != null ? Cases.fromJson(json["cases"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "cases": cases?.toJson(),
      };
}

class Cases {
  int? id;
  int? userId;
  dynamic doctorId;
  String? title;
  String? name;
  String? age;
  String? gender;
  String? description;
  int? rejected;
  String? reason;
  String? history;
  String? guid;

  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;
  List<Media>? media;
  List<Media>? treatment;
  Cvs? cvs;
  Doctor? user;
  Doctor? doctor;

  Cases({
    this.id,
    this.userId,
    this.doctorId,
    this.title,
    this.name,
    this.age,
    this.description,
    this.history,
    this.guid,
    this.gender,
    this.rejected,
    this.reason,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.media,
    this.treatment,
    this.cvs,
    this.user,
    this.doctor,
  });

  factory Cases.fromJson(Map<String, dynamic> json) => Cases(
        id: json["id"],
        userId: json["user_id"],
        doctorId: json["doctor_id"],
        title: json["title"],
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        description: json["description"],
        rejected: json["rejected"],
        reason: json["reason"],
        history: json["history"],
        guid: json["guid"],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        status: json["status"],
        media: json["media"] != null
            ? List<Media>.from(json["media"].map((x) => Media.fromJson(x)))
            : null,
        treatment: json["treatment"] != null
            ? List<Media>.from(json["treatment"].map((x) => Media.fromJson(x)))
            : null,
        cvs: json["cvs"] != null ? Cvs.fromJson(json["cvs"]) : null,
        user: json["user"] != null ? Doctor.fromJson(json["user"]) : null,
        doctor: json["doctor"] != null ? Doctor.fromJson(json["doctor"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "doctor_id": doctorId,
        "title": title,
        "name": name,
        "age": age,
        "description": description,
        "rejected": rejected,
        "reason": reason,
        "gender": gender,
        "history": history,
        "guid": guid,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "status": status,
        "media": media != null
            ? List<dynamic>.from(media!.map((x) => x.toJson()))
            : null,
        "treatment": treatment != null
            ? List<dynamic>.from(treatment!.map((x) => x.toJson()))
            : null,
        "cvs": cvs?.toJson(),
        "user": user?.toJson(),
        "doctor": doctor?.toJson(),
      };
}

class Cvs {
  int? id;
  String? hypertension;
  String? valvular;
  String? angina;
  String? myocardial;
  String? infective;
  String? failure;
  String? surgery;
  String? message;
  String? others;
  String? guid;
  int? caseId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? nausea;
  String? vomiting;
  String? peptic;
  String? gutOthers;
  String? chestPain;
  String? asthma;
  String? bronchitis;
  String? pneumonia;
  String? respOthers;
  String? tuberculossis;
  String? tuberOthers;
  String? hepatitis;
  String? hepOthers;
  String? anemia;
  String? bleedingDisorder;
  String? clothingDisorder;
  String? leukemia;
  String? circulatoryOthers;
  String? uti;
  String? kenalFailure;
  String? urinaryOthers;
  String? seizure;
  String? epilepsy;
  String? nervousOthers;
  String? diabetes;
  String? hyperparathyrodism;
  String? hyperthyrodism;
  String? hyperthyrodismNew;
  String? endocrineOthers;
  String? drughistory;

  Cvs(
      {this.id,
      this.hypertension,
      this.valvular,
      this.angina,
      this.myocardial,
      this.infective,
      this.failure,
      this.surgery,
      this.others,
      this.guid,
      this.caseId,
      this.createdAt,
      this.updatedAt,
      this.nausea,
      this.vomiting,
      this.peptic,
      this.gutOthers,
      this.chestPain,
      this.asthma,
      this.bronchitis,
      this.pneumonia,
      this.respOthers,
      this.tuberculossis,
      this.tuberOthers,
      this.hepatitis,
      this.hepOthers,
      this.anemia,
      this.bleedingDisorder,
      this.clothingDisorder,
      this.leukemia,
      this.circulatoryOthers,
      this.uti,
      this.kenalFailure,
      this.urinaryOthers,
      this.seizure,
      this.epilepsy,
      this.nervousOthers,
      this.diabetes,
      this.hyperparathyrodism,
      this.hyperthyrodism,
      this.message,
      this.hyperthyrodismNew,
      this.endocrineOthers,
      this.drughistory});

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
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
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
        message: json["message"],
        drughistory: json["drug_history"],
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
        "message": message,
        "drughistory": drughistory,
      };
}

class Media {
  int? id;
  String? originalUrl;

  Media({
    this.id,
    this.originalUrl,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        originalUrl: json["original_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "original_url": originalUrl,
      };
}

class Doctor {
  int? id;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  String? hospitalName;
  String? address;
  String? licenseNumber;
  String? specialization;
  String? experience;
  String? phoneNumber;
  int? isUser;
  int? status;
  String? provider;

  Doctor({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.hospitalName,
    this.address,
    this.licenseNumber,
    this.specialization,
    this.experience,
    this.phoneNumber,
    this.isUser,
    this.status,
    this.provider,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"] != null
            ? DateTime.parse(json["email_verified_at"])
            : null,
        hospitalName: json["hospital_name"],
        address: json["address"],
        licenseNumber: json["license_number"],
        specialization: json["specialization"],
        experience: json["experience"],
        phoneNumber: json["phone_number"],
        isUser: json["is_user"],
        status: json["status"],
        provider: json["provider"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "hospital_name": hospitalName,
        "address": address,
        "license_number": licenseNumber,
        "specialization": specialization,
        "experience": experience,
        "phone_number": phoneNumber,
        "is_user": isUser,
        "status": status,
        "provider": provider,
      };
}
