class AppUser {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? token;
  String? phoneNumber;

  AppUser({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.token,
    this.phoneNumber,
  });

  // Convert AppUser to JSON (Map)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'token': token,
      'phoneNumber': phoneNumber,
    };
  }

  // Create an AppUser from JSON (Map)
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      token: json['token'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
