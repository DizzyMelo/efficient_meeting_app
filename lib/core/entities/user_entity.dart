class User {
  User({
    required this.termsAccepted,
    required this.stars,
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.photo,
    required this.phone,
    required this.password,
    required this.status,
    required this.v,
  });

  bool termsAccepted;
  int stars;
  String id;
  String firstname;
  String lastname;
  String email;
  String photo;
  String phone;
  String? password;
  String status;
  int? v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        termsAccepted: json["termsAccepted"],
        stars: json["stars"],
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        photo: json["photo"],
        phone: json["phone"],
        password: json["password"],
        status: json["status"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "termsAccepted": termsAccepted,
        "stars": stars,
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "photo": photo,
        "phone": phone,
        "password": password,
        "status": status,
        "__v": v,
      };

  static User? user;
}
