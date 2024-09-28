class User {
  final String email;
  final String username;
  final String password;

  User({
    required this.email,
    required this.username,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'email': String email,
        'username': String username,
        'password': String password,
      } =>
        User(email: email, username: username, password: password),
      _ => throw const FormatException('Failed to load user'),
    };
  }
}
