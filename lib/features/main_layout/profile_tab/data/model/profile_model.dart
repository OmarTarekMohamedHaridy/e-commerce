class ProfileModel {
  String fullName;
  String Phone;
  String email;
  String Password;

  ProfileModel({required this.fullName,
    required this.Phone,
    required this.email,
    required this.Password});

  Map<String, dynamic> toJson() {
    return {
      "name": fullName,
      "email": email,
      "password": Password,
      "rePassword": Password,
      "phone": Phone
    };
  }
}