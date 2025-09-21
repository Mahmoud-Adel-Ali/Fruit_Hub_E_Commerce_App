class UserEntity {
  final String name;
  final String uId;
  final String email;

  UserEntity({required this.name, required this.uId, required this.email});

  // toMap
  Map<String, dynamic> toMap() => {'name': name, 'uId': uId, 'email': email};
}
