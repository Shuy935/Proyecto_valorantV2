import 'dart:convert';

GearResponse welcomeFromJson(String str) => GearResponse.fromJson(json.decode(str));

String welcomeToJson(GearResponse data) => json.encode(data.toJson());

class GearResponse {
    int status;
    List<Equip> data;

    GearResponse({
        required this.status,
        required this.data,
    });

    factory GearResponse.fromJson(Map<String, dynamic> json) => GearResponse(
        status: json["status"],
        data: List<Equip>.from(json["data"].map((x) => Equip.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Equip {
    String uuid;
    String displayName;
    String description;
    String displayIcon;
    String assetPath;
    ShopData shopData;

    Equip({
        required this.uuid,
        required this.displayName,
        required this.description,
        required this.displayIcon,
        required this.assetPath,
        required this.shopData,
    });

    factory Equip.fromJson(Map<String, dynamic> json) => Equip(
        uuid: json["uuid"],
        displayName: json["displayName"],
        description: json["description"],
        displayIcon: json["displayIcon"],
        assetPath: json["assetPath"],
        shopData: ShopData.fromJson(json["shopData"]),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon,
        "assetPath": assetPath,
        "shopData": shopData.toJson(),
    };
}

class ShopData {
    int cost;
    String category;
    String categoryText;
    dynamic gridPosition;
    bool canBeTrashed;
    dynamic image;
    String newImage;
    dynamic newImage2;
    String assetPath;

    ShopData({
        required this.cost,
        required this.category,
        required this.categoryText,
        required this.gridPosition,
        required this.canBeTrashed,
        required this.image,
        required this.newImage,
        required this.newImage2,
        required this.assetPath,
    });

    factory ShopData.fromJson(Map<String, dynamic> json) => ShopData(
        cost: json["cost"],
        category: json["category"],
        categoryText: json["categoryText"],
        gridPosition: json["gridPosition"],
        canBeTrashed: json["canBeTrashed"],
        image: json["image"],
        newImage: json["newImage"],
        newImage2: json["newImage2"],
        assetPath: json["assetPath"],
    );

    Map<String, dynamic> toJson() => {
        "cost": cost,
        "category": category,
        "categoryText": categoryText,
        "gridPosition": gridPosition,
        "canBeTrashed": canBeTrashed,
        "image": image,
        "newImage": newImage,
        "newImage2": newImage2,
        "assetPath": assetPath,
    };
}
