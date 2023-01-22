class User {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;
  final String token;

  const User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
      name: jsonData['name'],
      email: jsonData['email'],
      phoneNumber: jsonData['phone_no'],
      password: jsonData[' password'],
      confirmPassword: jsonData['confirmPassword'],
      token: jsonData['token'],
    );
  }
}
