class User {
  final String password;
  final String email;
  final String? access_token;

  User(this.access_token, {required this.password, required this.email});

  @override
  String toString() => 'User { name: $password, email: $email}';
}
