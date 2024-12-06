import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  bool? status;
  Data? data;
  String? message;

  ProfileModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
        "message": message,
      };
}

class Data {
  Profile? profile;

  Data({
    required this.profile,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "profile": profile!.toJson(),
      };
}

class Profile {
  int id;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  String? hospitalName;
  String? address; // Nullable field
  String licenseNumber;
  String? specialization; // Nullable field
  String experience;
  String? phoneCountryCode; // Nullable field
  String? phoneCode;
  String? phoneNumber;
  int? isUser;
  int? status;
  String? provider;
  String? fcmToken; // Nullable field
  String? accessToken; // Nullable field
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  int? caseCount;
  List<dynamic>? media;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.hospitalName,
    this.address, // Nullable parameter
    required this.licenseNumber,
    this.specialization, // Nullable parameter
    required this.experience,
    this.phoneCountryCode, // Nullable parameter
    required this.phoneCode,
    required this.phoneNumber,
    required this.isUser,
    required this.status,
    required this.provider,
    this.fcmToken, // Nullable parameter
    this.accessToken, // Nullable parameter
    required this.createdAt,
    required this.updatedAt,
    required this.image,
    required this.caseCount,
    required this.media,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        hospitalName: json["hospital_name"],
        address: json["address"], // Nullable, so it can be null
        licenseNumber: json["license_number"],
        specialization: json["specialization"], // Nullable, so it can be null
        experience: json["experience"],
        phoneCountryCode:
            json["phone_country_code"], // Nullable, so it can be null
        phoneCode: json["phone_code"],
        phoneNumber: json["phone_number"],
        isUser: json["is_user"],
        status: json["status"],
        provider: json["provider"],
        fcmToken: json["fcm_token"], // Nullable, so it can be null
        accessToken: json["access_token"], // Nullable, so it can be null
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
        caseCount: json["case_count"],
        media: List<dynamic>.from(json["media"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt!.toIso8601String(),
        "hospital_name": hospitalName,
        "address": address,
        "license_number": licenseNumber,
        "specialization": specialization,
        "experience": experience,
        "phone_country_code": phoneCountryCode,
        "phone_code": phoneCode,
        "phone_number": phoneNumber,
        "is_user": isUser,
        "status": status,
        "provider": provider,
        "fcm_token": fcmToken,
        "access_token": accessToken,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "image": image,
        "case_count": caseCount,
        "media": List<dynamic>.from(media!.map((x) => x)),
      };
}
