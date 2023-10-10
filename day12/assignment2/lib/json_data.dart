import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class JsonData {
  String name;
  String description;
  String image;
  int price;

  JsonData({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });

  @override
  String toString() {
    return 'JsonData(name: $name, description: $description, image: $image, price: $price)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'image': image,
      'price': price,
    };
  }

  factory JsonData.fromMap(Map<String, dynamic> map) {
    return JsonData(
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      price: map['price'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory JsonData.fromJson(String source) =>
      JsonData.fromMap(json.decode(source) as Map<String, dynamic>);
}
