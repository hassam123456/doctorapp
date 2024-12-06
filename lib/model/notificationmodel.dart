// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  bool status;
  Data data;
  String message;

  NotificationModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
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
  List<Notification> notifications;
  Pagination pagination;

  Data({
    required this.notifications,
    required this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        notifications: List<Notification>.from(
            json["notifications"].map((x) => Notification.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "notifications":
            List<dynamic>.from(notifications.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class Notification {
  int id;
  int userId;
  String title;
  String message;
  dynamic caseGuid;
  int isRead;
  int isSeen;
  DateTime createdAt;
  DateTime updatedAt;
  User user;
  dynamic patientCase;

  Notification({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.caseGuid,
    required this.isRead,
    required this.isSeen,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.patientCase,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        message: json["message"],
        caseGuid: json["case_guid"],
        isRead: json["is_read"],
        isSeen: json["is_seen"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
        patientCase: json["patient_case"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "message": message,
        "case_guid": caseGuid,
        "is_read": isRead,
        "is_seen": isSeen,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
        "patient_case": patientCase,
      };
}

class User {
  int id;
  String name;
  String email;
  DateTime emailVerifiedAt;
  String hospitalName;
  dynamic address;
  String licenseNumber;
  dynamic specialization;
  String experience;
  dynamic phoneCountryCode;
  String phoneCode;
  String phoneNumber;
  int isUser;
  int status;
  String provider;
  dynamic fcmToken;
  dynamic accessToken;
  DateTime createdAt;
  DateTime updatedAt;
  int caseCount;
  List<dynamic> media;

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
    required this.caseCount,
    required this.media,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        hospitalName: json["hospital_name"],
        address: json["address"],
        licenseNumber: json["license_number"],
        specialization: json["specialization"],
        experience: json["experience"],
        phoneCountryCode: json["phone_country_code"],
        phoneCode: json["phone_code"],
        phoneNumber: json["phone_number"],
        isUser: json["is_user"],
        status: json["status"],
        provider: json["provider"],
        fcmToken: json["fcm_token"],
        accessToken: json["access_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        caseCount: json["case_count"],
        media: List<dynamic>.from(json["media"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "case_count": caseCount,
        "media": List<dynamic>.from(media.map((x) => x)),
      };
}

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
