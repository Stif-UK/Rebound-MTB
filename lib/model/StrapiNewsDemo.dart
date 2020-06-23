class StrapiNewsDemo {
  bool draft;
  List<PostImages> postImages;
  String sId;
  String headline;
  String body;
  String createdAt;
  String updatedAt;
  int iV;
  PostImages coverImage;
  String id;

  StrapiNewsDemo(
      {this.draft,
        this.postImages,
        this.sId,
        this.headline,
        this.body,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.coverImage,
        this.id});

  StrapiNewsDemo.fromJson(Map<String, dynamic> json) {
    draft = json['Draft'];
    if (json['Post_Images'] != null) {
      postImages = new List<PostImages>();
      json['Post_Images'].forEach((v) {
        postImages.add(new PostImages.fromJson(v));
      });
    }
    sId = json['_id'];
    headline = json['Headline'];
    body = json['Body'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    coverImage = json['Cover_Image'] != null
        ? new PostImages.fromJson(json['Cover_Image'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Draft'] = this.draft;
    if (this.postImages != null) {
      data['Post_Images'] = this.postImages.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['Headline'] = this.headline;
    data['Body'] = this.body;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.coverImage != null) {
      data['Cover_Image'] = this.coverImage.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class PostImages {
  String sId;
  String name;
  String alternativeText;
  String caption;
  String hash;
  String ext;
  String mime;
  double size;
  int width;
  int height;
  String url;
  Formats formats;
  String provider;
  List<String> related;
  String createdAt;
  String updatedAt;
  int iV;
  String id;

  PostImages(
      {this.sId,
        this.name,
        this.alternativeText,
        this.caption,
        this.hash,
        this.ext,
        this.mime,
        this.size,
        this.width,
        this.height,
        this.url,
        this.formats,
        this.provider,
        this.related,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.id});

  PostImages.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
    formats =
    json['formats'] != null ? new Formats.fromJson(json['formats']) : null;
    provider = json['provider'];
    related = json['related'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['alternativeText'] = this.alternativeText;
    data['caption'] = this.caption;
    data['hash'] = this.hash;
    data['ext'] = this.ext;
    data['mime'] = this.mime;
    data['size'] = this.size;
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    if (this.formats != null) {
      data['formats'] = this.formats.toJson();
    }
    data['provider'] = this.provider;
    data['related'] = this.related;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['id'] = this.id;
    return data;
  }
}

class Formats {
  Thumbnail thumbnail;
  Thumbnail large;
  Thumbnail medium;
  Thumbnail small;

  Formats({this.thumbnail, this.large, this.medium, this.small});

  Formats.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    large =
    json['large'] != null ? new Thumbnail.fromJson(json['large']) : null;
    medium =
    json['medium'] != null ? new Thumbnail.fromJson(json['medium']) : null;
    small =
    json['small'] != null ? new Thumbnail.fromJson(json['small']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    if (this.large != null) {
      data['large'] = this.large.toJson();
    }
    if (this.medium != null) {
      data['medium'] = this.medium.toJson();
    }
    if (this.small != null) {
      data['small'] = this.small.toJson();
    }
    return data;
  }
}

class Thumbnail {
  String hash;
  String ext;
  String mime;
  int width;
  int height;
  double size;
  Null path;
  String url;

  Thumbnail(
      {this.hash,
        this.ext,
        this.mime,
        this.width,
        this.height,
        this.size,
        this.path,
        this.url});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
    path = json['path'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hash'] = this.hash;
    data['ext'] = this.ext;
    data['mime'] = this.mime;
    data['width'] = this.width;
    data['height'] = this.height;
    data['size'] = this.size;
    data['path'] = this.path;
    data['url'] = this.url;
    return data;
  }
}

