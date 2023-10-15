// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'definition.dart';

class Meaning {
  String partOfSpeech;
  List<Definition> definitions;

  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'partOfSpeech': partOfSpeech,
      'definitions': definitions.map((x) => x.toMap()).toList(),
    };
  }

  factory Meaning.fromMap(Map<String, dynamic> map) {
    return Meaning(
      partOfSpeech: map['partOfSpeech'],
      definitions: List<Definition>.from(
        (map['definitions']).map(
          (e) => Definition.fromMap(e),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Meaning.fromJson(String source) =>
      Meaning.fromMap(json.decode(source) as Map<String, dynamic>);
}
