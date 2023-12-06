import 'dart:convert';

MapaResponse welcomeFromJson(String str) => MapaResponse.fromJson(json.decode(str));

String welcomeToJson(MapaResponse data) => json.encode(data.toJson());

class MapaResponse {
    int status;
    List<MapaV> data;

    MapaResponse({
        required this.status,
        required this.data,
    });

    factory MapaResponse.fromJson(Map<String, dynamic> json) => MapaResponse(
        status: json["status"],
        data: List<MapaV>.from(json["data"].map((x) => MapaV.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class MapaV {
    String uuid;
    String displayName;
    String? narrativeDescription;
    TacticalDescription? tacticalDescription;
    String? coordinates;
    String? displayIcon;
    String listViewIcon;
    String splash;
    String assetPath;
    String mapUrl;
    double xMultiplier;
    double yMultiplier;
    double xScalarToAdd;
    double yScalarToAdd;
    List<Callout>? callouts;

    MapaV({
        required this.uuid,
        required this.displayName,
        required this.narrativeDescription,
        required this.tacticalDescription,
        required this.coordinates,
        required this.displayIcon,
        required this.listViewIcon,
        required this.splash,
        required this.assetPath,
        required this.mapUrl,
        required this.xMultiplier,
        required this.yMultiplier,
        required this.xScalarToAdd,
        required this.yScalarToAdd,
        required this.callouts,
    });

    factory MapaV.fromJson(Map<String, dynamic> json) => MapaV(
        uuid: json["uuid"],
        displayName: json["displayName"],
        narrativeDescription: json["narrativeDescription"],
        tacticalDescription: tacticalDescriptionValues.map[json["tacticalDescription"]],
        coordinates: json["coordinates"],
        displayIcon: json["displayIcon"],
        listViewIcon: json["listViewIcon"],
        splash: json["splash"],
        assetPath: json["assetPath"],
        mapUrl: json["mapUrl"],
        xMultiplier: json["xMultiplier"]?.toDouble(),
        yMultiplier: json["yMultiplier"]?.toDouble(),
        xScalarToAdd: json["xScalarToAdd"]?.toDouble(),
        yScalarToAdd: json["yScalarToAdd"]?.toDouble(),
        callouts: json["callouts"] == null ? [] : List<Callout>.from(json["callouts"]!.map((x) => Callout.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "narrativeDescription": narrativeDescription,
        "tacticalDescription": tacticalDescriptionValues.reverse[tacticalDescription],
        "coordinates": coordinates,
        "displayIcon": displayIcon,
        "listViewIcon": listViewIcon,
        "splash": splash,
        "assetPath": assetPath,
        "mapUrl": mapUrl,
        "xMultiplier": xMultiplier,
        "yMultiplier": yMultiplier,
        "xScalarToAdd": xScalarToAdd,
        "yScalarToAdd": yScalarToAdd,
        "callouts": callouts == null ? [] : List<dynamic>.from(callouts!.map((x) => x.toJson())),
    };
}

class Callout {
    String regionName;
    SuperRegionName superRegionName;
    Location location;

    Callout({
        required this.regionName,
        required this.superRegionName,
        required this.location,
    });

    factory Callout.fromJson(Map<String, dynamic> json) => Callout(
        regionName: json["regionName"],
        superRegionName: superRegionNameValues.map[json["superRegionName"]]!,
        location: Location.fromJson(json["location"]),
    );

    Map<String, dynamic> toJson() => {
        "regionName": regionName,
        "superRegionName": superRegionNameValues.reverse[superRegionName],
        "location": location.toJson(),
    };
}

class Location {
    double x;
    double y;

    Location({
        required this.x,
        required this.y,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        x: json["x"]?.toDouble(),
        y: json["y"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
    };
}

enum SuperRegionName {
    A,
    ATACANTES,
    B,
    C,
    DEFENSORES,
    MID
}

final superRegionNameValues = EnumValues({
    "A": SuperRegionName.A,
    "Atacantes": SuperRegionName.ATACANTES,
    "B": SuperRegionName.B,
    "C": SuperRegionName.C,
    "Defensores": SuperRegionName.DEFENSORES,
    "Mid": SuperRegionName.MID
});

enum TacticalDescription {
    A_B_C_SITES,
    A_B_SITES
}

final tacticalDescriptionValues = EnumValues({
    "A/B/C Sites": TacticalDescription.A_B_C_SITES,
    "A/B Sites": TacticalDescription.A_B_SITES
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
