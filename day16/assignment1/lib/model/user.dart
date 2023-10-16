import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// pub.dev 패키지 : freezed, json-annotation

class User {
  String id;
  String username;
  String email;
  String name;
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
