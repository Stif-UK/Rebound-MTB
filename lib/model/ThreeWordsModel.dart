class ThreeWordsModel {
  String country;
  Square square;
  String nearestPlace;
  Corner coordinates;
  String words;
  String language;
  String map;

  ThreeWordsModel(
      {this.country,
        this.square,
        this.nearestPlace,
        this.coordinates,
        this.words,
        this.language,
        this.map});

  ThreeWordsModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    square =
    json['square'] != null ? new Square.fromJson(json['square']) : null;
    nearestPlace = json['nearestPlace'];
    coordinates = json['coordinates'] != null
        ? new Corner.fromJson(json['coordinates'])
        : null;
    words = json['words'];
    language = json['language'];
    map = json['map'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    if (this.square != null) {
      data['square'] = this.square.toJson();
    }
    data['nearestPlace'] = this.nearestPlace;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates.toJson();
    }
    data['words'] = this.words;
    data['language'] = this.language;
    data['map'] = this.map;
    return data;
  }
}

class Square {
  Corner southwest;
  Corner northeast;

  Square({this.southwest, this.northeast});

  Square.fromJson(Map<String, dynamic> json) {
    southwest = json['southwest'] != null
        ? new Corner.fromJson(json['southwest'])
        : null;
    northeast = json['northeast'] != null
        ? new Corner.fromJson(json['northeast'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.southwest != null) {
      data['southwest'] = this.southwest.toJson();
    }
    if (this.northeast != null) {
      data['northeast'] = this.northeast.toJson();
    }
    return data;
  }
}

class Corner {
  double lng;
  double lat;

  Corner({this.lng, this.lat});

  Corner.fromJson(Map<String, dynamic> json) {
    lng = json['lng'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    return data;
  }
}
