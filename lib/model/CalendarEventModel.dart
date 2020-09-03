class CalendarEventModel {
  int id;
  String eventdate;
  String title;
  String description;
  bool hidden;
  CreatedBy createdBy;
  CreatedBy updatedBy;
  String createdAt;
  String updatedAt;
  String location;
  Coverimage coverimage;


  @override
  String toString() {
    return 'CalendarEventModel{$title}';
  }

  CalendarEventModel(
      {this.id,
        this.eventdate,
        this.title,
        this.description,
        this.hidden,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.location,
        this.coverimage});

  CalendarEventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventdate = json['eventdate'];
    title = json['title'];
    description = json['description'];
    hidden = json['Hidden'];
    createdBy = json['created_by'] != null
        ? new CreatedBy.fromJson(json['created_by'])
        : null;
    updatedBy = json['updated_by'] != null
        ? new CreatedBy.fromJson(json['updated_by'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    location = json['Location'];
    coverimage = json['coverimage'] != null
        ? new Coverimage.fromJson(json['coverimage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['eventdate'] = this.eventdate;
    data['title'] = this.title;
    data['description'] = this.description;
    data['Hidden'] = this.hidden;
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy.toJson();
    }
    if (this.updatedBy != null) {
      data['updated_by'] = this.updatedBy.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['Location'] = this.location;
    if (this.coverimage != null) {
      data['coverimage'] = this.coverimage.toJson();
    }
    return data;
  }
}

class CreatedBy {
  int id;
  String firstname;
  String lastname;
  Null username;

  CreatedBy({this.id, this.firstname, this.lastname, this.username});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['username'] = this.username;
    return data;
  }
}

class Coverimage {
  int id;
  String name;
  String alternativeText;
  String caption;
  int width;
  int height;
  Formats formats;
  String hash;
  String ext;
  String mime;
  double size;
  String url;
  String previewUrl;
  String provider;
  Null providerMetadata;
  int createdBy;
  int updatedBy;
  String createdAt;
  String updatedAt;

  Coverimage(
      {this.id,
        this.name,
        this.alternativeText,
        this.caption,
        this.width,
        this.height,
        this.formats,
        this.hash,
        this.ext,
        this.mime,
        this.size,
        this.url,
        this.previewUrl,
        this.provider,
        this.providerMetadata,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt});

  Coverimage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats = json['formats'];
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
    previewUrl = json['previewUrl'];
    provider = json['provider'];
    providerMetadata = json['provider_metadata'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alternativeText'] = this.alternativeText;
    data['caption'] = this.caption;
    data['width'] = this.width;
    data['height'] = this.height;
    data['formats'] = this.formats;
    data['hash'] = this.hash;
    data['ext'] = this.ext;
    data['mime'] = this.mime;
    data['size'] = this.size;
    data['url'] = this.url;
    data['previewUrl'] = this.previewUrl;
    data['provider'] = this.provider;
    data['provider_metadata'] = this.providerMetadata;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Thumbnail {
  String ext;
  String url;
  String hash;
  String mime;
  String name;
  Null path;
  double size;
  int width;
  int height;

  Thumbnail(
      {this.ext,
        this.url,
        this.hash,
        this.mime,
        this.name,
        this.path,
        this.size,
        this.width,
        this.height});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    ext = json['ext'];
    url = json['url'];
    hash = json['hash'];
    mime = json['mime'];
    name = json['name'];
    path = json['path'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ext'] = this.ext;
    data['url'] = this.url;
    data['hash'] = this.hash;
    data['mime'] = this.mime;
    data['name'] = this.name;
    data['path'] = this.path;
    data['size'] = this.size;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class Formats {
  Large large;
  Large small;
  Large medium;
  Large thumbnail;

  Formats({this.large, this.small, this.medium, this.thumbnail});

  Formats.fromJson(Map<String, dynamic> json) {
    large = json['large'] != null ? new Large.fromJson(json['large']) : null;
    small = json['small'] != null ? new Large.fromJson(json['small']) : null;
    medium = json['medium'] != null ? new Large.fromJson(json['medium']) : null;
    thumbnail = json['thumbnail'] != null
        ? new Large.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.large != null) {
      data['large'] = this.large.toJson();
    }
    if (this.small != null) {
      data['small'] = this.small.toJson();
    }
    if (this.medium != null) {
      data['medium'] = this.medium.toJson();
    }
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    return data;
  }
}

class Large {
  String ext;
  String url;
  String hash;
  String mime;
  String name;
  Null path;
  double size;
  int width;
  int height;

  Large(
      {this.ext,
        this.url,
        this.hash,
        this.mime,
        this.name,
        this.path,
        this.size,
        this.width,
        this.height});

  Large.fromJson(Map<String, dynamic> json) {
    ext = json['ext'];
    url = json['url'];
    hash = json['hash'];
    mime = json['mime'];
    name = json['name'];
    path = json['path'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ext'] = this.ext;
    data['url'] = this.url;
    data['hash'] = this.hash;
    data['mime'] = this.mime;
    data['name'] = this.name;
    data['path'] = this.path;
    data['size'] = this.size;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}
