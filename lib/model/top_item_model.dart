import 'dart:convert';

TopItem topItemFromMap(String str) {
  try {
    return TopItem.fromMap(json.decode(str));
  } catch (e) {
    return TopItem();
  }
}

String topItemToMap(TopItem data) => json.encode(data.toMap());

class TopItem {
  final List<MainStickyMenu> mainStickyMenu;
  final String? status;
  final String? message;

  TopItem({
    this.mainStickyMenu = const [],
    this.status,
    this.message,
  });

  factory TopItem.fromMap(Map<String, dynamic> json) {
    try {
      return TopItem(
        mainStickyMenu: json["main_sticky_menu"] == null
            ? []
            : List<MainStickyMenu>.from(json["main_sticky_menu"]!
                .map((x) => MainStickyMenu.fromMap(x))),
        status: json["status"],
        message: json["message"],
      );
    } catch (e) {
      return TopItem();
    }
  }

  Map<String, dynamic> toMap() => {
        "main_sticky_menu":
            List<dynamic>.from(mainStickyMenu.map((x) => x.toMap())),
        "status": status,
        "message": message,
      };
}

class MainStickyMenu {
  final String? title;
  final String? image;
  final String? sortOrder;
  final List<SliderImage> sliderImages;

  MainStickyMenu({
    this.title,
    this.image,
    this.sortOrder,
    this.sliderImages = const [],
  });

  factory MainStickyMenu.fromMap(Map<String, dynamic> json) {
    try {
      return MainStickyMenu(
        title: json["title"],
        image: json["image"],
        sortOrder: json["sort_order"],
        sliderImages: json["slider_images"] == null
            ? []
            : List<SliderImage>.from(
                json["slider_images"]!.map((x) => SliderImage.fromMap(x))),
      );
    } catch (e) {
      return MainStickyMenu();
    }
  }

  Map<String, dynamic> toMap() => {
        "title": title,
        "image": image,
        "sort_order": sortOrder,
        "slider_images": List<dynamic>.from(sliderImages.map((x) => x.toMap())),
      };
}

class SliderImage {
  final String? title;
  final String? image;
  final String? sortOrder;
  final String? cta;

  SliderImage({
    this.title,
    this.image,
    this.sortOrder,
    this.cta,
  });

  factory SliderImage.fromMap(Map<String, dynamic> json) {
    try {
      return SliderImage(
        title: json["title"],
        image: json["image"],
        sortOrder: json["sort_order"],
        cta: json["cta"],
      );
    } catch (e) {
      return SliderImage();
    }
  }

  Map<String, dynamic> toMap() => {
        "title": title,
        "image": image,
        "sort_order": sortOrder,
        "cta": cta,
      };
}
