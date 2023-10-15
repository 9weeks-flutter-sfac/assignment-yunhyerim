// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'License.dart';

class Phonetic {
  String text;
  String? audio;
  String? sourceUrl;
  License license;
  Phonetic({
    required this.text,
    required this.audio,
    required this.sourceUrl,
    required this.license,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'audio': audio,
      'sourceUrl': sourceUrl,
      'license': license.toMap(),
    };
  }

  factory Phonetic.fromMap(Map<String, dynamic> map) {
    return Phonetic(
      text: map['text'],
      audio: map['audio'],
      sourceUrl: map['sourceUrl'],
      license: License.fromMap(map['license']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Phonetic.fromJson(String source) =>
      Phonetic.fromMap(json.decode(source) as Map<String, dynamic>);
}
