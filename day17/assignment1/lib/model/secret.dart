import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Secret {
  String? author;
  String? authorName;
  String? collectionId;
  String? collectionName;
  String? created;
  String? id;
  String? secret;
  String? updated;
  Secret({
    this.author,
    this.authorName,
    this.collectionId,
    this.collectionName,
    this.created,
    this.id,
    this.secret,
    this.updated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'authorName': authorName,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'id': id,
      'secret': secret,
      'updated': updated,
    };
  }

  factory Secret.fromMap(Map<String, dynamic> map) {
    return Secret(
      author: map['author'] != null ? map['author'] as String : null,
      authorName:
          map['authorName'] != null ? map['authorName'] as String : null,
      collectionId:
          map['collectionId'] != null ? map['collectionId'] as String : null,
      collectionName: map['collectionName'] != null
          ? map['collectionName'] as String
          : null,
      created: map['created'] != null ? map['created'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      secret: map['secret'] != null ? map['secret'] as String : null,
      updated: map['updated'] != null ? map['updated'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Secret.fromJson(String source) =>
      Secret.fromMap(json.decode(source) as Map<String, dynamic>);
}
