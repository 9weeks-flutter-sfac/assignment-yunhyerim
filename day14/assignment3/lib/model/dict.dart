// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';
import 'dart:math';

import 'License.dart';
import 'meaning.dart';
import 'phonetic.dart';

class Dict {
  String word;
  String? phonetic;
  List<Phonetic> phonetics;
  List<Meaning> meanings;
  License license;
  List<String> sourceUrls;
  Dict({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'phonetic': phonetic,
      'phonetics': phonetics.map((x) => x.toMap()).toList(),
      'meanings': meanings.map((x) => x.toMap()).toList(),
      'license': license.toMap(),
      'sourceUrls': sourceUrls,
    };
  }

  factory Dict.fromMap(Map<String, dynamic> map) {
    return Dict(
        word: map['word'],
        phonetic: map['phonetic'],
        phonetics: List<Phonetic>.from(
            map['phonetics'].map((e) => Phonetic.fromMap(e))),
        meanings:
            List<Meaning>.from(map['meanings'].map((e) => Meaning.fromMap(e))),
        license: License.fromMap(map['license']),
        sourceUrls: List<String>.from(['sourceUrls']));
  }

  factory Dict.fromJson(String source) =>
      Dict.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    // return 'Dict(word: $word, phonetic: $phonetic, phonetics: $phonetics, meanings: $meanings, license: $license, sourceUrls: $sourceUrls)';
    return "Dict(word: $word, phonetic: $phonetic)";
  }
}
