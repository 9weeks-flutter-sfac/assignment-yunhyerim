import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class License {
  String name;
  String url;
  License({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory License.fromMap(Map<String, dynamic> map) {
    return License(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory License.fromJson(String source) =>
      License.fromMap(json.decode(source) as Map<String, dynamic>);
}
