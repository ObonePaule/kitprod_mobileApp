import 'dart:convert';

AppUser userModelFromJson(String str) => AppUser.fromJson(json.decode(str));

String userModelToJson(AppUser data) => json.encode(data.toJson());

class AppUser {
  AppUser({this.uid, this.fullName, this.email, this.photoUrl});

  String? uid;
  String? fullName;
  String? email;
  String? photoUrl;

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        uid: json["uid"],
        fullName: json["fullName"],
        email: json["email"],
        photoUrl: json["photoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "fullName": fullName,
        "email": email,
        "photoUrl": photoUrl,
      };
}
