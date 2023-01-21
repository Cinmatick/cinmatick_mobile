class Post {
  final String name;
  final String email;
  final int phoneNumber;
  final String password;
  final String confirmPassword;

  const Post({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
  });

  factory Post.fromJson(Map<String, dynamic> jsonData) {
    return Post(
      name: jsonData['name'],
      email: jsonData['email'],
      phoneNumber: jsonData['phoneNumber'],
      password: jsonData[' password'],
      confirmPassword: jsonData['confirmPassword'],
    );
  }
}
