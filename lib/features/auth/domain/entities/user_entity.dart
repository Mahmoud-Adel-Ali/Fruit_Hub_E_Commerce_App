// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserEntity {
  final String name;
  final String uId;
  final String email;

  UserEntity({required this.name, required this.uId, required this.email});

  // toMap
  Map<String, dynamic> toMap() => {'name': name, 'uId': uId, 'email': email};

  UserEntity copyWith({String? name, String? uId, String? email}) {
    return UserEntity(
      name: name ?? this.name,
      uId: uId ?? this.uId,
      email: email ?? this.email,
    );
  }
}
