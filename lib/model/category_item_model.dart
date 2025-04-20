import 'dart:convert';

CategoryItem categoryItemFromMap(String str) {
  try {
    return CategoryItem.fromMap(json.decode(str));
  } catch (e) {
    return CategoryItem();
  }
}

String categoryItemToMap(CategoryItem data) => json.encode(data.toMap());

class CategoryItem {
  final List<CategoryData> categories;
  final String? bannerImage;
  final String? status;
  final String? message;

  CategoryItem({
    this.categories = const [],
    this.bannerImage,
    this.status,
    this.message,
  });

  factory CategoryItem.fromMap(Map<String, dynamic> json) {
    try {
      return CategoryItem(
        categories: json["categories"] == null
            ? []
            : List<CategoryData>.from(
                json["categories"]!.map((x) => CategoryData.fromMap(x))),
        bannerImage: json["banner_image"],
        status: json["status"],
        message: json["message"],
      );
    } catch (e) {
      return CategoryItem();
    }
  }

  Map<String, dynamic> toMap() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
        "banner_image": bannerImage,
        "status": status,
        "message": message,
      };
}

class CategoryData {
  final String? categoryId;
  final String? categoryName;
  final String? parentId;
  final List<Child> child;

  CategoryData({
    this.categoryId,
    this.categoryName,
    this.parentId,
    this.child = const [],
  });

  factory CategoryData.fromMap(Map<String, dynamic> json) {
    try {
      return CategoryData(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        parentId: json["parent_id"],
        child: json["child"] == null
            ? []
            : List<Child>.from(json["child"]!.map((x) => Child.fromMap(x))),
      );
    } catch (e) {
      return CategoryData();
    }
  }

  Map<String, dynamic> toMap() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "parent_id": parentId,
        "child": List<dynamic>.from(child.map((x) => x.toMap())),
      };
}

class Child {
  final String? categoryId;
  final String? categoryName;
  final String? parentId;

  Child({
    this.categoryId,
    this.categoryName,
    this.parentId,
  });

  factory Child.fromMap(Map<String, dynamic> json) {
    try {
      return Child(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        parentId: json["parent_id"],
      );
    } catch (e) {
      return Child();
    }
  }

  Map<String, dynamic> toMap() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "parent_id": parentId,
      };
}
