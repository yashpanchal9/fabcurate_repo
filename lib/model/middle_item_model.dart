import 'dart:convert';

MiddleItem middleItemFromMap(String str) {
  try {
    return MiddleItem.fromMap(json.decode(str));
  } catch (e) {
    return MiddleItem();
  }
}

String middleItemToMap(MiddleItem data) => json.encode(data.toMap());

class MiddleItem {
  final List<ShopByCategory> shopByCategory;
  final List<ShopByFabric> shopByFabric;
  final List<Unstitched> unstitched;
  final List<BoutiqueCollection> boutiqueCollection;
  final String? status;
  final String? message;

  MiddleItem({
    this.shopByCategory = const [],
    this.shopByFabric = const [],
    this.unstitched = const [],
    this.boutiqueCollection = const [],
    this.status,
    this.message,
  });

  factory MiddleItem.fromMap(Map<String, dynamic> json) {
    try {
      return MiddleItem(
        shopByCategory: json["shop_by_category"] == null
            ? []
            : List<ShopByCategory>.from(json["shop_by_category"]!
                .map((x) => ShopByCategory.fromMap(x))),
        shopByFabric: json["shop_by_fabric"] == null
            ? []
            : List<ShopByFabric>.from(
                json["shop_by_fabric"]!.map((x) => ShopByFabric.fromMap(x))),
        unstitched: json["unstitched"] == null
            ? []
            : List<Unstitched>.from(
                json["unstitched"]!.map((x) => Unstitched.fromMap(x))),
        boutiqueCollection: json["boutique_collection"] == null
            ? []
            : List<BoutiqueCollection>.from(json["boutique_collection"]!
                .map((x) => BoutiqueCollection.fromMap(x))),
        status: json["status"],
        message: json["message"],
      );
    } catch (e) {
      return MiddleItem();
    }
  }

  Map<String, dynamic> toMap() => {
        "shop_by_category":
            List<dynamic>.from(shopByCategory.map((x) => x.toMap())),
        "shop_by_fabric":
            List<dynamic>.from(shopByFabric.map((x) => x.toMap())),
        "unstitched": List<dynamic>.from(unstitched.map((x) => x.toMap())),
        "boutique_collection":
            List<dynamic>.from(boutiqueCollection.map((x) => x.toMap())),
        "status": status,
        "message": message,
      };
}

class BoutiqueCollection {
  final String? bannerImage;
  final String? name;
  final String? cta;
  final String? bannerId;

  BoutiqueCollection({
    this.bannerImage,
    this.name,
    this.cta,
    this.bannerId,
  });

  factory BoutiqueCollection.fromMap(Map<String, dynamic> json) {
    try {
      return BoutiqueCollection(
        bannerImage: json["banner_image"],
        name: json["name"],
        cta: json["cta"],
        bannerId: json["banner_id"],
      );
    } catch (e) {
      return BoutiqueCollection();
    }
  }

  Map<String, dynamic> toMap() => {
        "banner_image": bannerImage,
        "name": name,
        "cta": cta,
        "banner_id": bannerId,
      };
}

class ShopByCategory {
  final String? categoryId;
  final String? name;
  final String? tintColor;
  final String? image;
  final String? sortOrder;

  ShopByCategory({
    this.categoryId,
    this.name,
    this.tintColor,
    this.image,
    this.sortOrder,
  });

  factory ShopByCategory.fromMap(Map<String, dynamic> json) {
    try {
      return ShopByCategory(
        categoryId: json["category_id"],
        name: json["name"],
        tintColor: json["tint_color"],
        image: json["image"],
        sortOrder: json["sort_order"],
      );
    } catch (e) {
      return ShopByCategory();
    }
  }

  Map<String, dynamic> toMap() => {
        "category_id": categoryId,
        "name": name,
        "tint_color": tintColor,
        "image": image,
        "sort_order": sortOrder,
      };
}

class ShopByFabric {
  final String? fabricId;
  final String? name;
  final String? tintColor;
  final String? image;
  final String? sortOrder;

  ShopByFabric({
    this.fabricId,
    this.name,
    this.tintColor,
    this.image,
    this.sortOrder,
  });

  factory ShopByFabric.fromMap(Map<String, dynamic> json) {
    try {
      return ShopByFabric(
        fabricId: json["fabric_id"],
        name: json["name"],
        tintColor: json["tint_color"],
        image: json["image"],
        sortOrder: json["sort_order"],
      );
    } catch (e) {
      return ShopByFabric();
    }
  }

  Map<String, dynamic> toMap() => {
        "fabric_id": fabricId,
        "name": name,
        "tint_color": tintColor,
        "image": image,
        "sort_order": sortOrder,
      };
}

class Unstitched {
  final String? rangeId;
  final String? name;
  final String? description;
  final String? image;

  Unstitched({
    this.rangeId,
    this.name,
    this.description,
    this.image,
  });

  factory Unstitched.fromMap(Map<String, dynamic> json) {
    try {
      return Unstitched(
        rangeId: json["range_id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
      );
    } catch (e) {
      return Unstitched();
    }
  }

  Map<String, dynamic> toMap() => {
        "range_id": rangeId,
        "name": name,
        "description": description,
        "image": image,
      };
}
