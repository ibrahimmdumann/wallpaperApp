import 'dart:convert';

MaterialWallpaper materialWallpaperFromJson(String str) => MaterialWallpaper.fromJson(json.decode(str));

String materialWallpaperToJson(MaterialWallpaper data) => json.encode(data.toJson());

class MaterialWallpaper {
    MaterialWallpaper({
        required this.materialWallpaper,
    });

    List<Images> materialWallpaper;

    factory MaterialWallpaper.fromJson(Map<String, dynamic> json) => MaterialWallpaper(
        materialWallpaper: List<Images>.from(json["MaterialWallpaper"].map((x) => Images.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "MaterialWallpaper": List<dynamic>.from(materialWallpaper.map((x) => x.toJson())),
    };
}
class Images {
    Images({
        required this.id,
        required this.catId,
        required this.image,
        required this.thumb,
        required this.orjImg
    });

    dynamic id;
    dynamic catId;
    String image;
    String thumb;
    String orjImg;

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"],
        catId: json["cat_id"],
        image: json["image"],
        thumb: "https://idriscelebi.com/eviller_scorpion/upload/thumbs/${json['image']}",
        orjImg: "https://idriscelebi.com/eviller_scorpion/upload/${json['image']}"
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cat_id": catId,
        "image": image,
    };
}
