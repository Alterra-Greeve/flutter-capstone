import 'dart:convert';

LeaderboardResponseModel leaderboardFromJson(String str) =>
    LeaderboardResponseModel.fromJson(json.decode(str));

String leaderboardToJson(LeaderboardResponseModel data) =>
    json.encode(data.toJson());

class LeaderboardResponseModel {
  bool? status;
  String? message;
  List<Datum>? data;

  LeaderboardResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory LeaderboardResponseModel.fromJson(Map<String, dynamic> json) =>
      LeaderboardResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

// class Datum {
//     String? id;
//     String? username;
//     String? name;
//     int? exp;
//     String? avatarUrl;
//     int? rank;

//     Datum({
//         this.id,
//         this.username,
//         this.name,
//         this.exp,
//         this.avatarUrl,
//         this.rank,
//     });

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         username: json["username"],
//         name: json["name"],
//         exp: json["exp"],
//         avatarUrl: json["avatar_url"],
//         rank: json["rank"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "username": username,
//         "name": name,
//         "exp": exp,
//         "avatar_url": avatarUrl,
//         "rank": rank,
//     };
// }

class Datum {
  String? id;
  String? username;
  String? name;
  int? exp;
  String? avatarUrl;
  int? rank;
  int? positionChange;

  Datum({
    this.id,
    this.username,
    this.name,
    this.exp,
    this.avatarUrl,
    this.rank,
    this.positionChange,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        exp: json["exp"],
        avatarUrl: json["avatar_url"],
        rank: json["rank"],
        positionChange: json["positionChange"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "exp": exp,
        "avatar_url": avatarUrl,
        "rank": rank,
        "positionChange": positionChange,
      };
}
