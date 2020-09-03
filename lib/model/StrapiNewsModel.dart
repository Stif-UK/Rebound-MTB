class StrapiNewsModel {
  int id;
//  Null nulldraft;
//  Null nullheadline;
//  Null nullbody;
//  CreatedBy createdBy;
//  CreatedBy updatedBy;
  String createdAt;
  String updatedAt;
  Author author;
  bool draft;
  String headline;
  String body;
  Photo coverImage;
  List<Photo> postImages;
  List<Tags> tags;

  StrapiNewsModel(
      {this.id,
//        this.nulldraft,
//        this.nullheadline,
//        this.nullbody,
//        this.createdBy,
//        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.author,
        this.draft,
        this.headline,
        this.body,
        this.coverImage,
        this.postImages,
        this.tags});

  StrapiNewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    draft = json['draft'];
    headline = json['headline'];
    body = json['Body'];
//    createdBy = json['created_by'] != null
//        ? new CreatedBy.fromJson(json['created_by'])
//        : null;
//    updatedBy = json['updated_by'] != null
//        ? new CreatedBy.fromJson(json['updated_by'])
//        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    draft = json['draft'];
//    headline = json['headline'];
    body = json['body'];
    coverImage = json['cover_image'] != null
        ? new Photo.fromJson(json['cover_image'])
        : null;
    if (json['post_images'] != null) {
      postImages = new List<Photo>();
      json['post_images'].forEach((v) {
        postImages.add(new Photo.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Draft'] = this.draft;
//    data['Headline'] = this.headline;
    data['Body'] = this.body;
//    if (this.createdBy != null) {
//      data['created_by'] = this.createdBy.toJson();
//    }
//    if (this.updatedBy != null) {
//      data['updated_by'] = this.updatedBy.toJson();
//    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['draft'] = this.draft;
    data['headline'] = this.headline;
    data['body'] = this.body;
    if (this.coverImage != null) {
      data['cover_image'] = this.coverImage.toJson();
    }
    if (this.postImages != null) {
      data['post_images'] = this.postImages.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

//class CreatedBy {
//  int id;
//  String firstname;
//  String lastname;
////  Null username;
//
//  CreatedBy({this.id, this.firstname, this.lastname, this.username});
//
//  CreatedBy.fromJson(Map<String, dynamic> json) {
//    id = json['id'];
//    firstname = json['firstname'];
//    lastname = json['lastname'];
//    username = json['username'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id'] = this.id;
//    data['firstname'] = this.firstname;
//    data['lastname'] = this.lastname;
//    data['username'] = this.username;
//    return data;
//  }
//}

class Author {
  int id;
//  Null nullname;
//  Null nulldescription;
//  int createdBy;
//  int updatedBy;
  String createdAt;
  String updatedAt;
  String name;
  String description;
  String bikes;
  Photo photo;

  Author(
      {this.id,
//        this.nullname,
//        this.nulldescription,
//        this.createdBy,
//        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.description,
        this.bikes,
        this.photo});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
//    name = json['Name'];
    description = json['Description'];
//    createdBy = json['created_by'];
//    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    description = json['description'];
    bikes = json['bikes'];
    photo = json['photo'] != null ? new Photo.fromJson(json['photo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['Description'] = this.description;
//    data['created_by'] = this.createdBy;
//    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['description'] = this.description;
    data['bikes'] = this.bikes;
    if (this.photo != null) {
      data['photo'] = this.photo.toJson();
    }
    return data;
  }
}

class Photo {
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
  Null previewUrl;
  String provider;
  Null providerMetadata;
  int createdBy;
  int updatedBy;
  String createdAt;
  String updatedAt;

  Photo(
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

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats =
    json['formats'] != null ? new Formats.fromJson(json['formats']) : null;
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
    if (this.formats != null) {
      data['formats'] = this.formats.toJson();
    }
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

//class CoverFormats {
//  Thumbnail thumbnail;
//
//  CoverFormats({this.thumbnail});
//
//  CoverFormats.fromJson(Map<String, dynamic> json) {
//    thumbnail = json['thumbnail'] != null
//        ? new Thumbnail.fromJson(json['thumbnail'])
//        : null;
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this.thumbnail != null) {
//      data['thumbnail'] = this.thumbnail.toJson();
//    }
//    return data;
//  }
//}

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
  Thumbnail large;
  Thumbnail small;
  Thumbnail medium;
  Thumbnail thumbnail;

  Formats({this.large, this.small, this.medium, this.thumbnail});

  Formats.fromJson(Map<String, dynamic> json) {
    large =
    json['large'] != null ? new Thumbnail.fromJson(json['large']) : null;
    small =
    json['small'] != null ? new Thumbnail.fromJson(json['small']) : null;
    medium =
    json['medium'] != null ? new Thumbnail.fromJson(json['medium']) : null;
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
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

class Tags {
  int id;
  String tagName;
  String description;
  int createdBy;
  int updatedBy;
  String createdAt;
  String updatedAt;

  Tags(
      {this.id,
        this.tagName,
        this.description,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tagName = json['tag_name'];
    description = json['description'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tag_name'] = this.tagName;
    data['description'] = this.description;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
