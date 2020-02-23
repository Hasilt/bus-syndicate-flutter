class LocationResult {
  int placeId;
  String licence;
  String osmType;
  int osmId;
  List<String> boundingbox;
  String lat;
  String lon;
  String displayName;
  String locationClass;
  String type;
  double importance;
  String icon;

  LocationResult({
    this.placeId,
    this.licence,
    this.osmType,
    this.osmId,
    this.boundingbox,
    this.lat,
    this.lon,
    this.displayName,
    this.locationClass,
    this.type,
    this.importance,
    this.icon,
  });

  factory LocationResult.fromJson(Map<String, dynamic> json) => LocationResult(
        placeId: json["place_id"],
        licence: json["licence"],
        osmType: json["osm_type"],
        osmId: json["osm_id"],
        boundingbox: List<String>.from(json["boundingbox"].map((x) => x)),
        lat: json["lat"],
        lon: json["lon"],
        displayName: json["display_name"],
        locationClass: json["class"],
        type: json["type"],
        importance: json["importance"].toDouble(),
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "place_id": placeId,
        "licence": licence,
        "osm_type": osmType,
        "osm_id": osmId,
        "boundingbox": List<dynamic>.from(boundingbox.map((x) => x)),
        "lat": lat,
        "lon": lon,
        "display_name": displayName,
        "class": locationClass,
        "type": type,
        "importance": importance,
        "icon": icon,
      };
}
