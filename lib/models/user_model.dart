class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.picture,
  });

  final Name? name;
  final String? email;
  final Picture? picture;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"] == null ? null : Name.fromJson(json["name"]),
      email: json["email"],
      picture:
          json["picture"] == null ? null : Picture.fromJson(json["picture"]),
    );
  }
}

class Name {
  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  final String? title;
  final String? first;
  final String? last;

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json["title"],
      first: json["first"],
      last: json["last"],
    );
  }
}

class Picture {
  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  final String? large;
  final String? medium;
  final String? thumbnail;

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json["large"],
      medium: json["medium"],
      thumbnail: json["thumbnail"],
    );
  }
}
