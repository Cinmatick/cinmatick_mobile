class User {
  final String name;
  final String password;
  final String token;

  User({required this.name, required this.password, required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['user'], password: json['password'], token: json['token']);
  }
}
