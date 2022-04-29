import 'dart:convert';

import 'package:collection/collection.dart';
class MyRadioList {
  final List<MyRadio> radios;
  MyRadioList({
    this.radios,
  });

  MyRadioList copyWith({
    List<MyRadio> radios,
  }) {
    return MyRadioList(
      radios: radios ?? this.radios,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'radios': radios.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory MyRadioList.fromMap(Map<String, dynamic> map) {
    return MyRadioList(
      radios: List<MyRadio>.from(map['radios']?.map((x) => MyRadio.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyRadioList.fromJson(String source) => MyRadioList.fromMap(json.decode(source));

  @override
  String toString() => 'MyRadioList(radios: $radios)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is MyRadioList &&
      listEquals(other.radios, radios);
  }

  @override
  int get hashCode => radios.hashCode;
}
class MyRadio {
  final int id;
  final int order;
  final String name;
  final String desc;
  final String url;
  final String image;
  final String icon;
  final String lang;
  final String category;
  final String tagline;
  final String color;
  MyRadio({
     this.id,
     this.order,
     this.name,
     this.desc,
     this.url,
     this.image,
     this.icon,
     this.lang,
     this.category,
     this.tagline,
     this.color,
  });


  MyRadio copyWith({
    int id,
    int order,
    String name,
    String desc,
    String url,
    String image,
    String icon,
    String lang,
    String category,
    String tagline,
    String color,
  }) {
    return MyRadio(
      id: id ?? this.id,
      order: order ?? this.order,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      url: url ?? this.url,
      image: image ?? this.image,
      icon: icon ?? this.icon,
      lang: lang ?? this.lang,
      category: category ?? this.category,
      tagline: tagline ?? this.tagline,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'order': order});
    result.addAll({'name': name});
    result.addAll({'desc': desc});
    result.addAll({'url': url});
    result.addAll({'image': image});
    result.addAll({'icon': icon});
    result.addAll({'lang': lang});
    result.addAll({'category': category});
    result.addAll({'tagline': tagline});
    result.addAll({'color': color});
  
    return result;
  }

  factory MyRadio.fromMap(Map<String, dynamic> map) {
    return MyRadio(
      id: map['id']?.toInt() ?? 0,
      order: map['order']?.toInt() ?? 0,
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      url: map['url'] ?? '',
      image: map['image'] ?? '',
      icon: map['icon'] ?? '',
      lang: map['lang'] ?? '',
      category: map['category'] ?? '',
      tagline: map['tagline'] ?? '',
      color: map['color'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MyRadio.fromJson(String source) => MyRadio.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MyRadio(id: $id, order: $order, name: $name, desc: $desc, url: $url, image: $image, icon: $icon, lang: $lang, category: $category, tagline: $tagline, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MyRadio &&
      other.id == id &&
      other.order == order &&
      other.name == name &&
      other.desc == desc &&
      other.url == url &&
      other.image == image &&
      other.icon == icon &&
      other.lang == lang &&
      other.category == category &&
      other.tagline == tagline &&
      other.color == color;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      order.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      url.hashCode ^
      image.hashCode ^
      icon.hashCode ^
      lang.hashCode ^
      category.hashCode ^
      tagline.hashCode ^
      color.hashCode;
  }
}
