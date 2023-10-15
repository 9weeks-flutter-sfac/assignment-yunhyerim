import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Definition {
  String definition;
  List<String> synonyms;
  List<String> antonyms;
  String? example;

  Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    required this.example,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'definition': definition,
      'synonyms': synonyms,
      'antonyms': antonyms,
      'example': example,
    };
  }

  factory Definition.fromMap(Map<String, dynamic> map) {
    // return Definition(
    //   definition: map['definition'] as String,
    //   synonyms: List<String>.from((map['synonyms'] as List<String>)),
    //   antonyms: List<String>.from((map['antonyms'] as List<String>)),
    //   example: map['example'] as String,
    // );
    return Definition(
      definition: map['definition'],
      synonyms: List<String>.from(map['synonyms']),
      antonyms: List<String>.from(map['antonyms']),
      example: map['example'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Definition.fromJson(String source) =>
      Definition.fromMap(json.decode(source) as Map<String, dynamic>);
}
