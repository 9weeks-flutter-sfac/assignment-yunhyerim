import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String? id;
  String? collectionId;
  String? collectionName;
  String? created;
  String? updated;
  String? username;
  bool verified;
  bool emailVisibility;
  String? email;
  String? name;
  String? avatar;
  User({
    this.id,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.username,
    required this.verified,
    required this.emailVisibility,
    this.email,
    this.name,
    this.avatar,
  });

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'collectionId': collectionId,
  //     'collectionName': collectionName,
  //     'created': created,
  //     'updated': updated,
  //     'username': username,
  //     'verified': verified,
  //     'emailVisibility': emailVisibility,
  //     'email': email,
  //     'name': name,
  //     'avatar': avatar,
  //   };
  // }

  // factory User.fromMap(Map<String, dynamic> map) {
  //   return User(
  //     id: map['id'],
  //     collectionId: map['collectionId'],
  //     collectionName: map['collectionName'],
  //     created: map['created'],
  //     updated: map['updated'],
  //     username: map['username'],
  //     verified: map['verified'],
  //     emailVisibility: map['emailVisibility'],
  //     email: map['email'],
  //     name: map['name'],
  //     avatar: map['avatar'],
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory User.fromJson(String source) =>
  //     User.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'updated': updated,
      'username': username,
      'verified': verified,
      'emailVisibility': emailVisibility,
      'email': email,
      'name': name,
      'avatar': avatar,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as String : null,
      collectionId:
          map['collectionId'] != null ? map['collectionId'] as String : null,
      collectionName: map['collectionName'] != null
          ? map['collectionName'] as String
          : null,
      created: map['created'] != null ? map['created'] as String : null,
      updated: map['updated'] != null ? map['updated'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      verified: map['verified'] as bool,
      emailVisibility: map['emailVisibility'] as bool,
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
