class UserEntity {
  final String name;
  final String uId;
  final String email;

  UserEntity({required this.name, required this.uId, required this.email});

  // Map<String, dynamic> toMap() => {
  //   AppKeys.name: name,
  //   AppKeys.uId: uId,
  //   AppKeys.email: email,
  // };

  UserEntity copyWith({String? name, String? uId, String? email}) {
    return UserEntity(
      name: name ?? this.name,
      uId: uId ?? this.uId,
      email: email ?? this.email,
    );
  }
}
