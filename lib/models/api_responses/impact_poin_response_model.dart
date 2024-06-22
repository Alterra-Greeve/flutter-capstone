// ignore_for_file: constant_identifier_names

import 'dart:convert';

class MonthlyImpact {
  final String month;
  final List<Point> points;

  MonthlyImpact({
    required this.month,
    required this.points,
  });

  factory MonthlyImpact.fromJson(Map<String, dynamic> json) {
    List<Point> pointsList = [];
    if (json['point'] != null) {
      pointsList =
          List<Point>.from(json['point'].map((x) => Point.fromJson(x)));
    }

    return MonthlyImpact(
      month: json['month'],
      points: pointsList,
    );
  }
}

class Point {
  final String name;
  final int point;

  Point({
    required this.name,
    required this.point,
  });

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      name: json['name'],
      point: json['point'],
    );
  }
}

enum Name {
  HEMAT_UANG,
  MENGURANGI_LIMBAH,
  MENGURANGI_PEMANASAN_GLOBAL,
  PERLUAS_WAWASAN
}

final nameValues = EnumValues({
  "Hemat Uang": Name.HEMAT_UANG,
  "Mengurangi Limbah": Name.MENGURANGI_LIMBAH,
  "Mengurangi Pemanasan Global": Name.MENGURANGI_PEMANASAN_GLOBAL,
  "Perluas Wawasan": Name.PERLUAS_WAWASAN
});

class Category {
  ImpactCategory impactCategory;

  Category({
    required this.impactCategory,
  });

  Category copyWith({
    ImpactCategory? impactCategory,
  }) =>
      Category(
        impactCategory: impactCategory ?? this.impactCategory,
      );

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        impactCategory: ImpactCategory.fromJson(json["impact_category"]),
      );

  Map<String, dynamic> toJson() => {
        "impact_category": impactCategory.toJson(),
      };
}

class ImpactCategory {
  Name name;
  int impactPoint;
  String iconUrl;

  ImpactCategory({
    required this.name,
    required this.impactPoint,
    required this.iconUrl,
  });

  ImpactCategory copyWith({
    Name? name,
    int? impactPoint,
    String? iconUrl,
  }) =>
      ImpactCategory(
        name: name ?? this.name,
        impactPoint: impactPoint ?? this.impactPoint,
        iconUrl: iconUrl ?? this.iconUrl,
      );

  factory ImpactCategory.fromRawJson(String str) =>
      ImpactCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImpactCategory.fromJson(Map<String, dynamic> json) => ImpactCategory(
        name: nameValues.map[json["name"]]!,
        impactPoint: json["impact_point"],
        iconUrl: json["icon_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "impact_point": impactPoint,
        "icon_url": iconUrl,
      };
}

class Image {
  String imageUrl;
  int position;

  Image({
    required this.imageUrl,
    required this.position,
  });

  Image copyWith({
    String? imageUrl,
    int? position,
  }) =>
      Image(
        imageUrl: imageUrl ?? this.imageUrl,
        position: position ?? this.position,
      );

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        imageUrl: json["image_url"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "position": position,
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
