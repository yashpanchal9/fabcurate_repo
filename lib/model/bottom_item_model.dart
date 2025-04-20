import 'dart:convert';

BottomItem bottomItemFromMap(String str) {
  try {
    return BottomItem.fromMap(json.decode(str));
  } catch (e) {
    return BottomItem();
  }
}

String bottomItemToMap(BottomItem data) => json.encode(data.toMap());

class BottomItem {
  final List<RangeOfPattern> rangeOfPattern;
  final List<DesignOccasion> designOccasion;
  final String? status;
  final String? message;

  BottomItem({
    this.rangeOfPattern = const [],
    this.designOccasion = const [],
    this.status,
    this.message,
  });

  factory BottomItem.fromMap(Map<String, dynamic> json) {
    try {
      return BottomItem(
        rangeOfPattern: json["range_of_pattern"] == null
            ? []
            : List<RangeOfPattern>.from(json["range_of_pattern"]!
                .map((x) => RangeOfPattern.fromMap(x))),
        designOccasion: json["design_occasion"] == null
            ? []
            : List<DesignOccasion>.from(
                json["design_occasion"]!.map((x) => DesignOccasion.fromMap(x))),
        status: json["status"],
        message: json["message"],
      );
    } catch (e) {
      return BottomItem();
    }
  }

  Map<String, dynamic> toMap() => {
        "range_of_pattern":
            List<dynamic>.from(rangeOfPattern.map((x) => x.toMap())),
        "design_occasion":
            List<dynamic>.from(designOccasion.map((x) => x.toMap())),
        "status": status,
        "message": message,
      };
}

class DesignOccasion {
  final String? productId;
  final String? name;
  final String? image;
  final String? subName;
  final String? cta;

  DesignOccasion({
    this.productId,
    this.name,
    this.image,
    this.subName,
    this.cta,
  });

  factory DesignOccasion.fromMap(Map<String, dynamic> json) {
    try {
      return DesignOccasion(
        productId: json["product_id"],
        name: json["name"],
        image: json["image"],
        subName: json["sub_name"],
        cta: json["cta"],
      );
    } catch (e) {
      return DesignOccasion();
    }
  }

  Map<String, dynamic> toMap() => {
        "product_id": productId,
        "name": name,
        "image": image,
        "sub_name": subName,
        "cta": cta,
      };
}

class RangeOfPattern {
  final String? productId;
  final String? image;
  final String? name;

  RangeOfPattern({
    this.productId,
    this.image,
    this.name,
  });

  factory RangeOfPattern.fromMap(Map<String, dynamic> json) {
    try {
      return RangeOfPattern(
        productId: json["product_id"],
        image: json["image"],
        name: json["name"],
      );
    } catch (e) {
      return RangeOfPattern();
    }
  }

  Map<String, dynamic> toMap() => {
        "product_id": productId,
        "image": image,
        "name": name,
      };
}
