class GeocodingResponse {
  GeocodingResponse({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });
  late final String name;
  late final dynamic lat;
  late final dynamic lon;
  late final String country;
  late final String state;

  GeocodingResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['country'] = country;
    _data['state'] = state;
    return _data;
  }
}
