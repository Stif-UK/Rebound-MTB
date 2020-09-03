class StrapiAuthModel {
  String _jwt;
  User _user;

  StrapiAuthModel({String jwt, User user}) {
    this._jwt = jwt;
    this._user = user;
  }

  String get jwt => _jwt;
  set jwt(String jwt) => _jwt = jwt;
  User get user => _user;
  set user(User user) => _user = user;

  StrapiAuthModel.fromJson(Map<String, dynamic> json) {
    _jwt = json['jwt'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jwt'] = this._jwt;
    if (this._user != null) {
      data['user'] = this._user.toJson();
    }
    return data;
  }
}

class User {
  int _id;
  String _username;
  String _email;
  String _provider;
  bool _confirmed;
  bool _blocked;
  Role _role;
  CreatedBy _createdBy;
  CreatedBy _updatedBy;
  String _createdAt;
  String _updatedAt;

  User(
      {int id,
        String username,
        String email,
        String provider,
        bool confirmed,
        bool blocked,
        Role role,
        CreatedBy createdBy,
        CreatedBy updatedBy,
        String createdAt,
        String updatedAt}) {
    this._id = id;
    this._username = username;
    this._email = email;
    this._provider = provider;
    this._confirmed = confirmed;
    this._blocked = blocked;
    this._role = role;
    this._createdBy = createdBy;
    this._updatedBy = updatedBy;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get username => _username;
  set username(String username) => _username = username;
  String get email => _email;
  set email(String email) => _email = email;
  String get provider => _provider;
  set provider(String provider) => _provider = provider;
  bool get confirmed => _confirmed;
  set confirmed(bool confirmed) => _confirmed = confirmed;
  bool get blocked => _blocked;
  set blocked(bool blocked) => _blocked = blocked;
  Role get role => _role;
  set role(Role role) => _role = role;
  CreatedBy get createdBy => _createdBy;
  set createdBy(CreatedBy createdBy) => _createdBy = createdBy;
  CreatedBy get updatedBy => _updatedBy;
  set updatedBy(CreatedBy updatedBy) => _updatedBy = updatedBy;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _provider = json['provider'];
    _confirmed = json['confirmed'];
    _blocked = json['blocked'];
    _role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    _createdBy = json['created_by'] != null
        ? new CreatedBy.fromJson(json['created_by'])
        : null;
    _updatedBy = json['updated_by'] != null
        ? new CreatedBy.fromJson(json['updated_by'])
        : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['username'] = this._username;
    data['email'] = this._email;
    data['provider'] = this._provider;
    data['confirmed'] = this._confirmed;
    data['blocked'] = this._blocked;
    if (this._role != null) {
      data['role'] = this._role.toJson();
    }
    if (this._createdBy != null) {
      data['created_by'] = this._createdBy.toJson();
    }
    if (this._updatedBy != null) {
      data['updated_by'] = this._updatedBy.toJson();
    }
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class Role {
  int _id;
  String _name;
  String _description;
  String _type;
  Null _createdBy;
  Null _updatedBy;

  Role(
      {int id,
        String name,
        String description,
        String type,
        Null createdBy,
        Null updatedBy}) {
    this._id = id;
    this._name = name;
    this._description = description;
    this._type = type;
    this._createdBy = createdBy;
    this._updatedBy = updatedBy;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get description => _description;
  set description(String description) => _description = description;
  String get type => _type;
  set type(String type) => _type = type;
  Null get createdBy => _createdBy;
  set createdBy(Null createdBy) => _createdBy = createdBy;
  Null get updatedBy => _updatedBy;
  set updatedBy(Null updatedBy) => _updatedBy = updatedBy;

  Role.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _type = json['type'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['description'] = this._description;
    data['type'] = this._type;
    data['created_by'] = this._createdBy;
    data['updated_by'] = this._updatedBy;
    return data;
  }
}

class CreatedBy {
  int _id;
  String _firstname;
  String _lastname;
  Null _username;

  CreatedBy({int id, String firstname, String lastname, Null username}) {
    this._id = id;
    this._firstname = firstname;
    this._lastname = lastname;
    this._username = username;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get firstname => _firstname;
  set firstname(String firstname) => _firstname = firstname;
  String get lastname => _lastname;
  set lastname(String lastname) => _lastname = lastname;
  Null get username => _username;
  set username(Null username) => _username = username;

  CreatedBy.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    data['username'] = this._username;
    return data;
  }
}