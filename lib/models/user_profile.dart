class User {
  User(
      {required this.isLurah,
      required this.isNakes,
      required this.username,
      required this.email,
      required this.password,
      required this.isLoggedIn,
      required this.firstName,
      required this.lastName,
      required this.province,
      required this.bio,
      required this.city,
      required this.gender,
      required this.phone,
      required this.birthDate,
      required this.district});

  bool isLurah;
  bool isNakes;
  String username;
  String email;
  String password;
  bool isLoggedIn;
  String firstName;
  String lastName;
  String province;
  String bio;
  String city;
  String gender;
  String phone;
  String birthDate;
  String district;

  factory User.fromJson(Map<String, dynamic> json) => User(
        isLurah: json["fields"]["is_lurah"],
        isNakes: json["fields"]["is_nakes"],
        username: json["fields"]["username"],
        email: json["fields"]["email"],
        password: json["fields"]["password"],
        isLoggedIn: true,
        firstName: json["fields"]["first_name"],
        lastName: json["fields"]["last_name"],
        province: json["fields"]["province"],
        bio: json["fields"]["bio"],
        city: json["fields"]["city"],
        gender: json["fields"]["gender"],
        phone: json["fields"]["number_phone"],
        birthDate: json["fields"]["date_of_birth"],
        district: json["fields"]["district"],
      );

// class UserArguments {
//   bool isLurah;
//   bool isNakes;
//   String username;
//   String email;
//   String password;
//   bool isLoggedIn;
//   String firstName;
//   String lastName;
//   String province;
//   String bio;
//   String city;
//   String gender;
//   String phone;
//   String birthDate;
//   String district;

//   UserArguments(
//       this.isLurah,
//       this.isNakes,
//       this.username,
//       this.email,
//       this.password,
//       this.isLoggedIn,
//       this.firstName,
//       this.lastName,
//       this.province,
//       this.bio,
//       this.city,
//       this.gender,
//       this.phone,
//       this.birthDate,
//       this.district);
// }
}
