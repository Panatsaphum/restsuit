import 'dart:convert';

class UserModle {
  final String name;
  final String email;
  UserModle({
    required this.name,
    required this.email,
  });

  UserModle copyWith({
    String? name,
    String? email,
  }) {
    return UserModle(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory UserModle.fromMap(Map<String, dynamic> map) {
    return UserModle(
      name: map['name'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModle.fromJson(String source) => UserModle.fromMap(json.decode(source));

  @override
  String toString() => 'UserModle(name: $name, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModle &&
      other.name == name &&
      other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}
